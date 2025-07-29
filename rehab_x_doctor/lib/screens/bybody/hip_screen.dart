import 'package:flutter/material.dart';
import '../exercise_details_screen.dart';
import '../qr_scanner_screen.dart';
import '../../models/exercise.dart';
import '../../services/exercise_service.dart';

class HipScreen extends StatefulWidget {
  const HipScreen({super.key});

  @override
  State<HipScreen> createState() => _HipScreenState();
}

class _HipScreenState extends State<HipScreen> {
  final ExerciseService _exerciseService = ExerciseService();
  List<Exercise> _hipExercises = [];
  List<Exercise> _filteredExercises = [];
  bool _isLoading = true;
  String? _error;

  // Filter states
  bool _isStretch = true;
  bool _isRight = true;

  @override
  void initState() {
    super.initState();
    _loadHipExercises();
  }

  Future<void> _loadHipExercises() async {
    try {
      final allExercises = await _exerciseService.getExercises();
      final hipExercises = allExercises.where((exercise) {
        return exercise.bodyPart?.toLowerCase().contains('hip') == true ||
               exercise.bodyPart?.toLowerCase().contains('สะโพก') == true;
      }).toList();

      setState(() {
        _hipExercises = hipExercises;
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

  // void _applyFilters() {
  //   setState(() {
  //     _filteredExercises = _hipExercises.where((exercise) {
  //       // Filter by type
  //       final title = exercise.title.toLowerCase();
  //       final description = exercise.description.toLowerCase();
  //       final titleThai = exercise.title;
  //       final descriptionThai = exercise.description;

  //       final matchesType = _isStretch
  //           ? title.contains('stretch') ||
  //             title.contains('stretching') ||
  //             description.contains('stretch') ||
  //             titleThai.contains('ยืด') ||
  //             descriptionThai.contains('ยืด')
  //           : title.contains('strengthen') ||
  //             title.contains('strength') ||
  //             description.contains('strengthen') ||
  //             titleThai.contains('เสริมแรง') ||
  //             descriptionThai.contains('เสริมแรง');

  //       final matchesSide = _isRight
  //           ? title.contains('right') ||
  //             description.contains('right') ||
  //             titleThai.contains('ขวา') ||
  //             descriptionThai.contains('ขวา') ||
  //             (!title.contains('left') &&
  //              !description.contains('left') &&
  //              !titleThai.contains('ซ้าย') &&
  //              !descriptionThai.contains('ซ้าย'))
  //           : title.contains('left') ||
  //             description.contains('left') ||
  //             titleThai.contains('ซ้าย') ||
  //             descriptionThai.contains('ซ้าย');

  //       return matchesType && matchesSide;
  //     }).toList();
  //   });
  // }
  
void _applyFilters() {
  setState(() {
    _filteredExercises = _hipExercises.where((exercise) {
      final title = exercise.title.toLowerCase();
      final description = exercise.description.toLowerCase();
      final titleThai = exercise.title;
      final descriptionThai = exercise.description;

      // 1. Filter by type
      final matchesType = _isStretch
          ? title.contains('stretch') ||
            title.contains('stretching') ||
            description.contains('stretch') ||
            titleThai.contains('ยืด') ||
            descriptionThai.contains('ยืด')
          : title.contains('strengthen') ||
            title.contains('strength') ||
            description.contains('strengthen') ||
            titleThai.contains('เสริมแรง') ||
            descriptionThai.contains('เสริมแรง');

      // 2. Check whether the text contains any left/right keywords
      final containsRight = title.contains('right') ||
                            description.contains('right') ||
                            titleThai.contains('ขวา') ||
                            descriptionThai.contains('ขวา');

      final containsLeft = title.contains('left') ||
                           description.contains('left') ||
                           titleThai.contains('ซ้าย') ||
                           descriptionThai.contains('ซ้าย');

      // 3. If no side is mentioned → allow for both left/right
      final noSideMentioned = !containsLeft && !containsRight;

      // 4. Filter by side
      final matchesSide = noSideMentioned
          ? true
          : _isRight
              ? containsRight
              : containsLeft;

      return matchesType && matchesSide;
    }).toList();
  });
}

  Widget _buildFilterButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Type Toggle
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                _buildToggleButton('Stretch', _isStretch, () {
                  setState(() {
                    _isStretch = true;
                    _applyFilters();
                  });
                }),
                _buildToggleButton('Strengthen', !_isStretch, () {
                  setState(() {
                    _isStretch = false;
                    _applyFilters();
                  });
                }),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Side Toggle
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                _buildToggleButton('ขวา', _isRight, () {
                  setState(() {
                    _isRight = true;
                    _applyFilters();
                  });
                }),
                _buildToggleButton('ซ้าย', !_isRight, () {
                  setState(() {
                    _isRight = false;
                    _applyFilters();
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1A237E) : Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rehab X - Hip Exercises',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRScannerScreen()),
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
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_error', style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadHipExercises,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_hipExercises.isEmpty) {
      return _buildEmptyMessage('No hip exercises available.');
    }

    if (_filteredExercises.isEmpty) {
      return _buildEmptyMessage('No exercises found for the selected filters.');
    }

    return Column(
      children: [
        _buildFilterButtons(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: _filteredExercises.length,
            itemBuilder: (context, index) {
              final exercise = _filteredExercises[index];
              return _buildExerciseCard(exercise);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseCard(Exercise exercise) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      shape: Theme.of(context).cardTheme.shape,
      elevation: Theme.of(context).cardTheme.elevation,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExerciseDetailsScreen(exercise: exercise)),
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
                            width: 80,
                            height: 80,
                            color: Colors.grey,
                            child: const Icon(Icons.broken_image, color: Colors.white),
                          );
                        },
                      )
                    : Container(
                        width: 80,
                        height: 80,
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
  }

  Widget _buildEmptyMessage(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
