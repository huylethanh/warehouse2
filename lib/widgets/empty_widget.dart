import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final EdgeInsets iconPadding;
  final double size;
  final Widget? action;
  const EmptyWidget({
    Key? key,
    this.icon = FontAwesomeIcons.noteSticky,
    this.title = "No items",
    this.size = 100,
    this.iconPadding = EdgeInsets.zero,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: iconPadding,
              child: Icon(
                icon,
                size: size,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (action != null) ...[
              const SizedBox(
                height: 20,
              ),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
