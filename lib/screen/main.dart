import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_6400922/components/main_padding.dart';
import 'package:midterm_6400922/screen/contact.dart';
import 'package:midterm_6400922/screen/favourite.dart';
// import 'package:midterm_6400922/screen/home.dart';
import 'package:midterm_6400922/screen/home_new.dart';
import 'package:midterm_6400922/screen/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller = PersistentTabController();
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      // MainPadding(child: HomeScreen()),
      const MainPadding(child: HomeNewScreen()),
      const MainPadding(child: FavouriteScreen()),
      const MainPadding(child: ContactScreen()),
      const MainPadding(child: ProfileScreen()),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final navBarsItemsInfo = [
      {
        "icon": Icons.home,
        "title": "หน้าหลัก",
      },
      {
        "icon": Icons.favorite,
        "title": "รายการโปรด",
      },
      {
        "icon": Icons.contact_page,
        "title": "ติดต่อเรา",
      },
      {
        "icon": Icons.person,
        "title": "โปรไฟล์",
      }
    ];

    return navBarsItemsInfo
        .map((e) => PersistentBottomNavBarItem(
              icon: Icon(e["icon"] as IconData),
              title: e["title"] as String,
              textStyle: GoogleFonts.notoSansThaiLooped(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              activeColorPrimary: Colors.red.shade900,
              inactiveColorPrimary: Colors.grey,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        elevation: 50,
        title: Row(
          children: [
            Icon(
              Icons.import_contacts,
              color: Colors.red.shade900,
              size: 40,
            ),
            const SizedBox(width: 10),
            Text(
              'ขายหนังสือ',
              style: GoogleFonts.chakraPetch(
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: PersistentTabView(
          backgroundColor: Colors.white,
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          // margin: const EdgeInsets.only(top: 10),
          navBarStyle: NavBarStyle.style1,
        ),
      ),
    );
  }
}
