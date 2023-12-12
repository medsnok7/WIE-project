import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wie/authentification/login.dart';
import 'package:wie/containers/customized_app_bar.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/views/competition_page.dart';
import 'package:wie/views/contact_us.dart';
import 'package:wie/views/explore.dart';
import 'package:wie/views/forum_page.dart';
import 'package:wie/views/settings_page.dart';
import 'package:wie/views/student_page.dart';
import 'package:wie/views/tutorial_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _children = const [
    ExplorePage(),
    ContactUsPage(),
    SettingsPage(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.themeColor,
        child: Scaffold(
          appBar: customizedAppBar(context, "HOME", true, true, true),
          drawer: Drawer(
            width: 250.w,
            shadowColor: Colors.deepPurple,
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              padding: MediaQuery.of(context).padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildHeader(context, Icons.home, "Home", const HomeView()),
                  buildMenuItems(context),
                  Divider(color: Colors.black.withOpacity(0.5), height: 1.h),
                  buildHeader(
                      context, Icons.settings, "Settings", const HomeView()),
                  Divider(height: 1.h, color: Colors.black.withOpacity(0.5)),
                  buildHeader(context, Icons.contact_page, "Contact us",
                      const HomeView()),
                  Divider(height: 1.h, color: Colors.black.withOpacity(0.5)),
                  buildHeader(
                      context, Icons.logout, "Log Out", const LoginView()),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            elevation: 10,
            selectedItemColor: AppColors.backgroundColor,
            unselectedItemColor: AppColors.backgroundColor.withOpacity(0.5),
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Contact Us',
                icon: Icon(Icons.contact_page),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          body: _children[_selectedIndex],
        ));
  }
}

Widget buildHeader(
    BuildContext context, IconData icon, String name, Widget page) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        navigate(context, page);
      },
    ),
  );
}

Widget buildMenuItems(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.book_online_outlined),
          title: const Text("Courses"),
          onTap: () {
            navigate(context, const TutorialView());
          },
        ),
        ListTile(
          leading: const Icon(Icons.cast_for_education),
          title: const Text("Students"),
          onTap: () {
            navigate(context, const StudentsView());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chat),
          title: const Text("Forum"),
          onTap: () {
            navigate(context, const ForumView());
          },
        ),
        ListTile(
          leading: const Icon(Icons.first_page),
          title: const Text("Competitions"),
          onTap: () {
            navigate(context, const CompetitionsView());
          },
        )
      ],
    ),
  );
}
