import 'package:flutter/material.dart';

class MKListTile extends StatelessWidget {
  final String title;
  final Widget? badge;
  final IconData? icon;
  final Color? color;
  final bool hasTrailing;
  final VoidCallback? onPressed;

  const MKListTile({
    Key? key,
    required this.title,
    this.badge,
    this.icon,
    this.color,
    this.hasTrailing = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMain = Theme.of(context);
    final theme = themeMain.bottomNavigationBarTheme;
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            horizontalTitleGap: 0,
            minLeadingWidth: 15,
            tileColor: theme.backgroundColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 16,
                    color: color,
                  ),
                  SizedBox(width: 15),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color ?? theme.selectedItemColor,
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                ),
                if (badge != null) ...[
                  Spacer(),
                  badge!,
                ]
              ],
            ),
            trailing: hasTrailing ? Icon(Icons.chevron_right) : null,
          ),
          Divider(height: 1, color: themeMain.colorScheme.background)
        ],
      ),
    );
  }
}
