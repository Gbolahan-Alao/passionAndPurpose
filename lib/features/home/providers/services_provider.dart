// lib/features/auth/home/presentation/providers/service_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Service {
  final String title;
  final IconData icon;
  final String detailsPageRoute;

  Service({
    required this.title,
    required this.icon,
    required this.detailsPageRoute,
  });
}

final serviceProvider = Provider<List<Service>>((ref) {
  return [
    Service(
      title: 'Individual Treatment Plans',
      icon: Icons.person,
      detailsPageRoute: '/individual-treatment-plans',
    ),
    Service(
      title: 'Mental Health Services',
      icon: Icons.healing,
      detailsPageRoute: '/mental-health-services',
    ),
    Service(
      title: 'Dual Diagnosis',
      icon: Icons.home,
      detailsPageRoute: '/dual-diagnosis',
    ),
    Service(
      title: 'Vocational Services',
      icon: Icons.work,
      detailsPageRoute: '/vocational-services',
    ),
    Service(
      title: 'Physical Health & Wellness',
      icon: Icons.fitness_center,
      detailsPageRoute: '/physical-health-wellness',
    ),
    Service(
      title: 'Holistic Therapy',
      icon: Icons.healing,
      detailsPageRoute: '/holistic-therapy',
    ),
    Service(
      title: 'Financial Assistance',
      icon: Icons.attach_money,
      detailsPageRoute: '/financial-assistance',
    ),
  ];
});
