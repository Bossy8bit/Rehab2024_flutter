import 'package:flutter/material.dart';
import '../exercise_details_screen.dart';
import '../qr_scanner_screen.dart';
import '../../models/exercise.dart';
import '../../services/exercise_service.dart';

// Changed class name from ShoulderScreen to ArmScreen
class ArmScreen extends StatefulWidget {
  const ArmScreen({super.key});

  @override
  State<ArmScreen> createState() => _ArmScreenState();
}

// Changed state class name
class _ArmScreenState extends State<ArmScreen> {
  final ExerciseService _exerciseService = ExerciseService();
  // Changed variable name to reflect content
  List<Exercise> _armExercises = [];
  List<Exercise> _filteredExercises = [];
  bool _isLoading = true;
  String? _error;
  
  // Filter states
  bool _isStretch = true; // true for Stretch, false for Strengthen
  bool _isRight = true; // true for Right, false for Left

  @override
  void initState() {
    super.initState();
    // Changed method call
    _loadArmExercises();
  }

  // Changed method name and logic
  Future<void> _loadArmExercises() async {
    try {
      final allExercises = await _exerciseService.getExercises();
      // **** IMPORTANT: Updated filtering logic for 'arm' and 'แขน' ****
      final armExercises = allExercises.where((exercise) {
        return exercise.bodyPart?.toLowerCase().contains('arm') == true ||
               exercise.bodyPart?.toLowerCase().contains('แขน') == true;
           
      }).toList();
      
      setState(() {
        _armExercises = armExercises;
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
      _filteredExercises = _armExercises.where((exercise) {
        // Filter by exercise type (stretch/strengthen)
        bool matchesType = true;
        if (_isStretch) {
          matchesType = exercise.title.toLowerCase().contains('stretch') ||
                       exercise.title.toLowerCase().contains('stretching') ||
                       exercise.description.toLowerCase().contains('stretch') ||
                       exercise.title.contains('ยืด') ||
                       exercise.description.contains('ยืด');
        } else {
          matchesType = exercise.title.toLowerCase().contains('strengthen') ||
                       exercise.title.toLowerCase().contains('strength') ||
                       exercise.description.toLowerCase().contains('strengthen') ||
                       exercise.title.contains('เสริมแรง') ||
                       exercise.description.contains('เสริมแรง');
        }

        // Filter by side (right/left)
        bool matchesSide = true;
        if (_isRight) {
          matchesSide = exercise.title.toLowerCase().contains('right') ||
                       exercise.description.toLowerCase().contains('right') ||
                       exercise.title.contains('ขวา') ||
                       exercise.description.contains('ขวา') ||
                       (!exercise.title.toLowerCase().contains('left') &&
                        !exercise.description.toLowerCase().contains('left') &&
                        !exercise.title.contains('ซ้าย') &&
                        !exercise.description.contains('ซ้าย'));
        } else {
          matchesSide = exercise.title.toLowerCase().contains('left') ||
                       exercise.description.toLowerCase().contains('left') ||
                       exercise.title.contains('ซ้าย') ||
                       exercise.description.contains('ซ้าย');
        }

        return matchesType && matchesSide;
      }).toList();
    });
  }

  Widget _buildFilterButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Stretch/Strengthen Toggle
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
                        _isStretch = true;
                        _applyFilters();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _isStretch ? const Color(0xFF1A237E) : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                      ),
                      child: Text(
                        'Stretch',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isStretch ? Colors.white : Colors.grey[600],
                          fontWeight: _isStretch ? FontWeight.bold : FontWeight.w500,
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
                        _isStretch = false;
                        _applyFilters();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !_isStretch ? const Color(0xFF1A237E) : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: Text(
                        'Strengthen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !_isStretch ? Colors.white : Colors.grey[600],
                          fontWeight: !_isStretch ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Right/Left Toggle (Thai)
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
        // Changed AppBar title
        title: Text('Rehab X - Arm Exercises', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
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
              // Changed method call for retry button
              onPressed: _loadArmExercises,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    // Check the correct list
    if (_armExercises.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sentiment_dissatisfied, size: 60, color: Colors.grey[400]),
            const SizedBox(height: 16),
            // Changed empty state text
            Text(
              'No arm exercises available.',
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
                  // Use the correct list and its length
                  itemCount: _filteredExercises.length,
                  itemBuilder: (context, index) {
                    // Get exercise from the correct list
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