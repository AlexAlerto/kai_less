import 'package:flutter/material.dart';
import 'package:kai_less/domain/entitys/service/service_menu_item_enum.dart';
import 'package:kai_less/presentation/widgets/general/theme_switcher_widget.dart';
import 'package:kai_less/presentation/widgets/service_screen/ui/menu_item_widget.dart';
class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Сервисы",
        ),
        centerTitle: true,
        elevation: 0,
        actions: [ThemeSwitcherWidget()],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ServiceMenuItem.values.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return MenuItemWidget(
                    serviceMenuItem: ServiceMenuItem.values[index],
                  );
                },
              ),
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
