import 'package:flutter/material.dart';

class WeekCheckWidget extends StatefulWidget {
  final ValueNotifier<bool> controller;

  const WeekCheckWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<WeekCheckWidget> createState() => _WeekCheckWidgetState();
}

class _WeekCheckWidgetState extends State<WeekCheckWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        widget.controller.value = !widget.controller.value;
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          clipBehavior: Clip.hardEdge,
          child: Container(
            decoration: BoxDecoration(
              color: theme.bottomNavigationBarTheme.selectedItemColor
                  ?.withOpacity(0.1),
            ),
            child: ValueListenableBuilder<bool>(
              valueListenable: widget.controller,
              builder: (context, value, _) {
                return Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      top: 0,
                      bottom: 0,
                      right: value ? 25 : 120,
                      left: value ? 0 : -95,
                      child: Center(
                        child: Text(
                          'Четная',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme
                                .bottomNavigationBarTheme.selectedItemColor,
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      top: 0,
                      bottom: 0,
                      right: value ? -95 : 0,
                      left: value ? 120 : 25,
                      child: Center(
                        child: Text(
                          'Нечетная',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme
                                .bottomNavigationBarTheme.selectedItemColor,
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      top: 0,
                      bottom: 0,
                      left: value ? 95 : 0,
                      right: value ? 0 : 95,
                      child: Center(
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
