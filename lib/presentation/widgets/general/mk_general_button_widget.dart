import 'package:flutter/material.dart';
import 'package:kai_less/core/colors.dart';
import 'package:kai_less/presentation/widgets/general/loader_widget.dart';

class MKGeneralButtonWidget extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double minWidth;

  const MKGeneralButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.minWidth = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: minWidth,
      onPressed: onPressed,
      disabledColor: kTitleColor,
      disabledElevation: 0,
      padding: EdgeInsets.symmetric(vertical: isLoading ? 10 : 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: kTitleColor,
      child: isLoading
          ? Container(
              width: 30,
              child: LoadingWidget(
                size: 30,
                isLight: true,
              ),
            )
          : Text(
              'Отправить',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
    );
  }
}
