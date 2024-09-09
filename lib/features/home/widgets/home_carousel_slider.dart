import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:passion_purpose/features/home/widgets/cards/home_carousel_card.dart';

class HomeCarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250, // Adjust height as needed
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        scrollPhysics: BouncingScrollPhysics(),
      ),
      items: [
        HomeCarouselCard(
          title: 'Holistic Healing',
          description:
              'Our Faith-Based treatment facility focuses on addressing not only the physical aspects of addiction or mental health issues but also the emotional, social, and spiritual dimensions. We strive to provide comprehensive care that encompasses the whole person.',
        ),
        HomeCarouselCard(
          title: 'Spiritual Guidance',
          description:
              'Our facility offers spiritual support, guidance, and teachings consistent with the particular faith tradition that we represent which is God the Father, Jesus as Son, and the Holy Spirit as our comforter. We include rituals such as prayer, meditation, and counseling rooted in spiritual principles as part of the treatment process.',
        ),
        HomeCarouselCard(
          title: 'Community Support',
          description:
              'Our faith-based treatment facility often emphasizes the importance of a supportive community in the recovery journey. We create an environment where individuals can connect with others who share their faith, providing a sense of belonging and encouragement.',
        ),
        HomeCarouselCard(
          title: 'Values-Based Approach',
          description:
              'Our facility aligns our treatment methods and therapeutic interventions with the principles and values of our tradition. We integrate ethical and moral teachings into the recovery process to help individuals develop a strong foundation for long-term healing/deliverance.',
        ),
        HomeCarouselCard(
          title: 'Faith-Centered Education',
          description:
              'Our facility offers educational programs, workshops, and counseling sessions that help individuals explore the role of faith in their lives, understand the relationship between spirituality and recovery, and gain the knowledge and tools needed for sustainable change.',
        ),
        HomeCarouselCard(
          title: 'Outreach & Ministry',
          description:
              'Our facility extends our mission beyond treatment by engaging in outreach efforts to support the wider community. We provide educational & prevention programs, and support networks to address not just addiction but the whole person and many of the other challenges that mental health brings into society.',
        ),
      ],
    );
  }
}
