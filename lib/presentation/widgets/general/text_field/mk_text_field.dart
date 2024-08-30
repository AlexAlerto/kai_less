import 'package:flutter/material.dart';
import 'package:kai_less/core/typography.dart';

class MKTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool hasIcon;
  final bool autofocus;
  final TextInputType? keyboardType;
  final Function(String result)? onSubmitted;

  const MKTextField({
    Key? key,
    required this.hintText,
    required this.textController,
    this.hasIcon = false,
    this.keyboardType,
    this.onSubmitted,
    this.autofocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).cardColor,
          ),
          child: TextField(
            autofocus: autofocus,
            controller: textController,
            style: TextStyle(
              fontSize: 14,
              color: theme.bottomNavigationBarTheme.selectedItemColor,
            ),
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              icon: Padding(
                padding: EdgeInsets.only(left: hasIcon ? 10 : 5),
                child: hasIcon
                    ? Icon(
                        Icons.report,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : null,
              ),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
