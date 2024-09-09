import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class AutoScrollServiceList extends StatefulWidget {
  final List<String> services;

  const AutoScrollServiceList({Key? key, required this.services})
      : super(key: key);

  @override
  _AutoScrollServiceListState createState() => _AutoScrollServiceListState();
}

class _AutoScrollServiceListState extends State<AutoScrollServiceList>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _autoScrollController;
  late Animation<double> _scrollAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _autoScrollController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(_autoScroll);

    _scrollAnimation =
        Tween<double>(begin: 0, end: 1).animate(_autoScrollController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    if (mounted && _scrollController.hasClients) {
      _autoScrollController.repeat();
    }
  }

  void _autoScroll() {
    if (_scrollController.hasClients) {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentOffset = _scrollController.offset;

      if (currentOffset < maxScrollExtent) {
        _scrollController.jumpTo(currentOffset + 1.0);
      } else {
        _scrollController.jumpTo(0);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.services.length,
        itemBuilder: (context, index) {
          final service = widget.services[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ServiceCard(
              title: service,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppTheme.primaryLight,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppTheme.textColor),
          ),
        ),
      ),
    );
  }
}
