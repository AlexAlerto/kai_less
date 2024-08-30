import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String? subTitle;

  const HeaderWidget({
    Key? key,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final backgroundColor = theme.backgroundColor;
    final firstColor = theme.unselectedItemColor;
    return Container(
      color: backgroundColor,
      width: size.width,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          if (subTitle != null)
            Text(
              subTitle!,
              style: TextStyle(
                color: firstColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }
}
