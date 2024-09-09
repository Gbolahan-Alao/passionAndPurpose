import 'package:flutter/material.dart';
import 'package:passion_purpose/features/home/widgets/cards/problem_card.dart';

class ProblemSolving extends StatelessWidget {
  const ProblemSolving({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final problems = [
      {
        'title': 'Mental Health Disorders',
        'description':
            'Addiction often co-occurs with mental health disorders like depression, anxiety, bipolar disorder, and post-traumatic stress disorder (PTSD).',
      },
      {
        'title': 'Health Issues',
        'description':
            'Substance abuse can lead to a variety of health problems, such as liver damage, heart disease, respiratory issues, and an increased risk of infectious diseases.',
      },
      {
        'title': 'Relationship',
        'description':
            'Addiction can strain relationships with family, friends, and romantic partners. Trust issues, emotional distance, and conflicts often arise due to the person’s behavior while under the influence.',
      },
      {
        'title': 'Isolation',
        'description':
            'Individuals struggling with addiction may isolate themselves to avoid judgment or may face stigma from others due to the perception of addiction as a moral failing rather than a disease.',
      },
    ];

    final assetImages = [
      'assets/images/image-1.png',
      'assets/images/image-2.jpg',
      'assets/images/image-3.jpg',
      'assets/images/image-fine.jpg',
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: problems.length,
      itemBuilder: (context, index) {
        final problem = problems[index];
        final imageAsset = assetImages[index % assetImages.length];

        return ProblemCard(
          title: problem['title']!,
          imageAsset: imageAsset,
        );
      },
    );
  }
}
