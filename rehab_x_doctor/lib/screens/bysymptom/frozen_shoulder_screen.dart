import 'package:flutter/material.dart';
import '../exercise_details_screen.dart';
import '../qr_scanner_screen.dart';
import '../../models/exercise.dart';
import '../../services/exercise_service.dart';

class FrozenShoulderScreen extends StatefulWidget {
  const FrozenShoulderScreen({super.key});

  @override
  State<FrozenShoulderScreen> createState() => _FrozenShoulderScreenState();
}

class _FrozenShoulderScreenState extends State<FrozenShoulderScreen> {
  final ExerciseService _exerciseService = ExerciseService();
  List<Exercise> _frozenShoulderExercises = [];
  List<Exercise> _filteredExercises = [];
  bool _isLoading = true;
  String? _error;
  
  // Filter states - only side filter remains
  bool _isRight = true; // true for Right, false for Left

  @override
  void initState() {
    super.initState();
    _loadFrozenShoulderExercises();
  }

  Future<void> _loadFrozenShoulderExercises() async {
    try {
      final allExercises = await _exerciseService.getExercises();
      // Filter exercises for frozen shoulder symptom
      final frozenShoulderExercises = allExercises.where((exercise) {
        return exercise.symptom?.toLowerCase().contains('frozen_shoulder') == true ||
               exercise.symptom?.contains('ไหล่แข็ง') == true;
      }).toList();
      
      setState(() {
        _frozenShoulderExercises = frozenShoulderExercises;
        _isLoading = false;
        _applyFilters();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _applyFilters() {
    setState(() {
      _filteredExercises = _frozenShoulderExercises.where((exercise) {
        final title = exercise.title.toLowerCase();
        final description = exercise.description.toLowerCase();
        final titleThai = exercise.title;
        final descriptionThai = exercise.description;

        final containsRight = title.contains('right') ||
                              description.contains('right') ||
                              titleThai.contains('ขวา') ||
                              descriptionThai.contains('ขวา');

        final containsLeft = title.contains('left') ||
                             description.contains('left') ||
                             titleThai.contains('ซ้าย') ||
                             descriptionThai.contains('ซ้าย');

        final noSideMentioned = !containsLeft && !containsRight;

        // If no side is mentioned, show in both left and right
        // If side is mentioned, only show when it matches the selected filter
        final matchesSide = noSideMentioned
            ? true  // Show exercises without side specification in both filters
            : _isRight
                ? containsRight
                : containsLeft;

        return matchesSide;
      }).toList();
    });
  }

  Widget _buildFilterButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Right/Left Toggle (Thai) - only this filter remains
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isRight = true;
                        _applyFilters();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _isRight ? const Color(0xFF1A237E) : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                      ),
                      child: Text(
                        'ขวา',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isRight ? Colors.white : Colors.grey[600],
                          fontWeight: _isRight ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isRight = false;
                        _applyFilters();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !_isRight ? const Color(0xFF1A237E) : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: Text(
                        'ซ้าย',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !_isRight ? Colors.white : Colors.grey[600],
                          fontWeight: !_isRight ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rehab X - Frozen Shoulder Exercises', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRScannerScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: $_error',
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadFrozenShoulderExercises,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_frozenShoulderExercises.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sentiment_dissatisfied, size: 60, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No frozen shoulder exercises available.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        _buildFilterButtons(),
        Expanded(
          child: _filteredExercises.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No exercises found for the selected filters.',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: _filteredExercises.length,
                  itemBuilder: (context, index) {
                    final exercise = _filteredExercises[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                      shape: Theme.of(context).cardTheme.shape,
                      elevation: Theme.of(context).cardTheme.elevation,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseDetailsScreen(exercise: exercise),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: exercise.imageUrls.isNotEmpty
                                    ? Image.asset(
                                        exercise.imageUrls.first,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: 80, height: 80,
                                            color: Colors.grey,
                                            child: const Icon(Icons.broken_image, color: Colors.white),
                                          );
                                        },
                                      )
                                    : Container(
                                        width: 80, height: 80,
                                        color: Colors.grey,
                                        child: const Icon(Icons.image_not_supported, color: Colors.white),
                                      ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(exercise.title, style: Theme.of(context).textTheme.titleMedium),
                                    const SizedBox(height: 4),
                                    Text(exercise.description, style: Theme.of(context).textTheme.bodyMedium),
                                    if (exercise.bodyPart != null) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        'Body Part: ${exercise.bodyPart}',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}