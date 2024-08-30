import 'package:flutter/material.dart';
import 'package:kai_less/domain/entitys/service/service_menu_item_enum.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuItemWidget extends StatelessWidget {
  final ServiceMenuItem serviceMenuItem;

  const MenuItemWidget({
    Key? key,
    required this.serviceMenuItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  serviceMenuItem.startColor,
                  serviceMenuItem.finishColor
                ],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: Icon(
                serviceMenuItem.icon,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              serviceMenuItem.label,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      onTap: () {
        if (serviceMenuItem == ServiceMenuItem.support) {
          _openUrl('https://t.me/kai_mobile');
        }
      },
    );
  }

  _openUrl(String? url) async {
    if (url != null && await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }
}
