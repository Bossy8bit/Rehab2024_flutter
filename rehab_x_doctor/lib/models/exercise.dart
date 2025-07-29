class Exercise {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final String? instructions;
  final int? duration;
  final int? repetitions;
  final String? bodyPart;
  final String? symptom;
  final String? side;
  final String? freeze;
  final String? wdumbel;
  final String? wsandbag;
  final String? ytEmbed;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    this.instructions,
    this.duration,
    this.repetitions,
    this.bodyPart,
    this.symptom,
    this.side,
    this.freeze,
    this.wdumbel,
    this.wsandbag,
    this.ytEmbed,
  });

  factory Exercise.fromMap(Map<String, dynamic> map) {
    // Concatenate all description fields for instructions
    final instructionsList = <String?>[];
    for (int i = 1; i <= 6; i++) {
      final desc = map['exer_desc$i'] as String?;
      if (desc != null && desc.isNotEmpty) {
        instructionsList.add(desc);
      }
    }
    final concatenatedInstructions = instructionsList.join('\n');

    final List<String> loadedImageUrls = [];
    String? fullImageName = map['exer_img']?.toString();

    print('Debug: fullImageName = $fullImageName'); // Debug print

    if (fullImageName != null && fullImageName.isNotEmpty) {
      String basePrefix = fullImageName;
      // Attempt to extract base prefix if image name contains a number suffix (e.g., 'NeLF01-3')
      final lastDashIndex = basePrefix.lastIndexOf('-');
      if (lastDashIndex != -1 && lastDashIndex < basePrefix.length - 1) {
        final suffixPart = basePrefix.substring(lastDashIndex + 1);
        if (int.tryParse(suffixPart) != null) {
          basePrefix = basePrefix.substring(0, lastDashIndex);
        }
      }
      print('Debug: basePrefix = $basePrefix'); // Debug print

      for (int i = 1; i <= 4; i++) {
        loadedImageUrls.add('assets/images/$basePrefix-$i.png');
      }
    }

    return Exercise(
      id: map['exer_ID'] as String,
      title: map['exer_Name'] as String,
      description: map['exer_Symptom'] as String? ?? 'No Description', // Assuming symptom is the description
      imageUrls: loadedImageUrls.isNotEmpty ? loadedImageUrls : ['assets/images/placeholder.png'], // Provide a placeholder if no images
      instructions: concatenatedInstructions.isNotEmpty ? concatenatedInstructions : null,
      duration: int.tryParse(map['exer_Repeat']?.toString() ?? ''),
      repetitions: int.tryParse(map['exer_NumofTimes']?.toString() ?? ''),
      bodyPart: map['exer_BodyPart'] as String?,
      symptom: map['exer_Symptom'] as String?,
      side: map['exer_Side'] as String?,
      freeze: map['exer_Freeze'] as String?,
      wdumbel: map['exer_Wdumbel'] as String?,
      wsandbag: map['exer_Wsandbag'] as String?,
      ytEmbed: map['exer_YTembed'] as String?,
    );
  }

  // Convert Exercise object to a Map for database operations (if needed for writing back)
  Map<String, dynamic> toMap() {
    return {
      'exer_ID': id,
      'exer_Name': title,
      'exer_Symptom': description,
      // 'exer_img': imageUrls.first, // Only saving the first image for now
      'exer_Repeat': duration,
      'exer_NumofTimes': repetitions,
      'exer_BodyPart': bodyPart,
      'exer_Side': side,
      'exer_Freeze': freeze,
      'exer_Wdumbel': wdumbel,
      'exer_Wsandbag': wsandbag,
      'exer_YTembed': ytEmbed,
      // Descriptions will need to be split and handled if writing back
    };
  }
} 