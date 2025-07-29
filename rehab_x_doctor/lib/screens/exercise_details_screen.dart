import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailsScreen({
    super.key,
    required this.exercise,
  });

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: widget.exercise.imageUrls.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.exercise.imageUrls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox.shrink();
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.exercise.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.exercise.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  if (widget.exercise.instructions != null && widget.exercise.instructions!.isNotEmpty) ...[
                    Text(
                      'Instructions:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(widget.exercise.instructions!, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 16),
                  ],
                  if (widget.exercise.duration != null) ...[
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.timer, color: Theme.of(context).colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              'Duration: ${widget.exercise.duration} seconds',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (widget.exercise.repetitions != null) ...[
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.repeat, color: Theme.of(context).colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              'Repetitions: ${widget.exercise.repetitions}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (widget.exercise.bodyPart != null && widget.exercise.bodyPart!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Body Part: ${widget.exercise.bodyPart}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (widget.exercise.symptom != null && widget.exercise.symptom!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Symptom: ${widget.exercise.symptom}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (widget.exercise.side != null && widget.exercise.side!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Side: ${widget.exercise.side}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (widget.exercise.freeze != null && widget.exercise.freeze!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Freeze: ${widget.exercise.freeze}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (widget.exercise.wdumbel != null && widget.exercise.wdumbel!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Weight (Dumbbell): ${widget.exercise.wdumbel}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (widget.exercise.wsandbag != null && widget.exercise.wsandbag!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Weight (Sandbag): ${widget.exercise.wsandbag}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (widget.exercise.ytEmbed != null && widget.exercise.ytEmbed!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'YouTube Embed: ${widget.exercise.ytEmbed}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // TODO: Implement start exercise functionality
      //   },
      //   label: const Text('Start Exercise'),
      //   icon: const Icon(Icons.play_arrow),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
} 