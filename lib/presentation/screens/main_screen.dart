import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kai_less/data/core/locator_service.dart';
import 'package:kai_less/presentation/screens/lessons_screen/lessons_screen.dart';
import 'package:kai_less/presentation/screens/services_screen/service_menu_screen.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/day_week_cubit/day_week_cubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  final date = locator<DayWeekCubit>();
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      date.updateDay();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarTheme = Theme.of(context).bottomNavigationBarTheme;
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            await _navigatorKeys[_selectedIndex].currentState?.maybePop();
        return isFirstRouteInCurrentTab != null
            ? !isFirstRouteInCurrentTab
            : true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _buildOffstageNavigator(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: bottomNavBarTheme.backgroundColor),
          child: SalomonBottomBar(
            currentIndex: _selectedIndex,
            unselectedItemColor: bottomNavBarTheme.unselectedItemColor,
            selectedItemColor: bottomNavBarTheme.selectedItemColor,
            onTap: (index) {
              if (_selectedIndex == index) {
                _navigatorKeys[index].currentState?.popUntil(
                      (route) => route.isFirst,
                    );
              }

              setState(
                () => _selectedIndex = index,
              );
            },
            items: [
              SalomonBottomBarItem(
                title: Text("Расписание"),
                icon: Icon(Icons.event_note_outlined),
                activeIcon: Icon(Icons.event_note),
              ),
              SalomonBottomBarItem(
                title: Text("Сервисы"),
                icon: Icon(EvaIcons.gridOutline),
                activeIcon: Icon(EvaIcons.grid),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          LessonsScreen(),
          ServiceScreen(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
