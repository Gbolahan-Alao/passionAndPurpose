import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class HeaderCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color backgroundColor;
  final void Function()? onTap;

  const HeaderCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  _HeaderCardState createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.98, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // Call the onTap function
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Card(
              color: widget.backgroundColor,
              elevation: 8,
              shadowColor: Colors.black.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100, // Reduced height
                  minWidth: 120,
                  maxHeight: 100, // Reduced max height
                  maxWidth: 120,
                ),
                padding: const EdgeInsets.all(6.0), // Reduced padding
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align content to left
                  children: [
                    Icon(
                      widget.icon,
                      size: 18, // Further reduced icon size
                      color: widget.backgroundColor == AppTheme.primaryColor
                          ? AppTheme.whiteColor
                          : AppTheme.textColor,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16, // Reduced text size further
                        fontWeight: FontWeight.bold,
                        color: widget.backgroundColor == AppTheme.primaryColor
                            ? AppTheme.whiteColor
                            : AppTheme.textColor,
                      ),
                    ),
                    //const SizedBox(height: 10),
                    Text(
                      widget.description,
                      textAlign: TextAlign.left, // Left alignment
                      style: TextStyle(
                        fontSize: 10, // Further reduced description text size
                        color: widget.backgroundColor == AppTheme.primaryColor
                            ? AppTheme.whiteColor.withOpacity(0.9)
                            : AppTheme.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
