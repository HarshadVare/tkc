import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tkc/config/app_router.dart';
import 'package:tkc/config/app_router_constatnt.dart';
import 'package:tkc/config/app_text.dart';
import 'package:tkc/features/AddItem/presentation/view/add_item.dart';
import 'package:tkc/features/Home/presentation/view/home.dart';
import 'package:tkc/features/Login/presentation/cubit/login_cubit.dart';
import 'package:tkc/features/profile.dart';
import 'package:tkc/theme/app_colors.dart';
import 'package:tkc/utils/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _pages = [Home(), AddItem(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        // elevation: 0.3,
        // centerTitle: true,
        title: Text(
          'Sales',
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.menu,
        //       color: Colors.black,
        //     )),
        actions: [
          TextButton.icon(
              onPressed: () {
                context.read<LoginCubit>().logout();
                AppRouter.pushReplacement(
                    AppRouterConstatnt.loginSCreen, context);
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.blackColor,
                size: 18,
              ),
              label: AppText(
                  text: 'Log Out',
                  color: AppColors.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400))
        ],
        // Adding bottom border
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0), // Thickness of the border
          child: Container(
            color: Colors.grey, // Border color
            height: 0.2, // Border height
          ),
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.buttonColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.homeIcon,
              height: 18,
              width: 10,
              color: _selectedIndex == 0 ? AppColors.buttonColor : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_outlined,
              size: 18,
            ),
            label: 'Add Items',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.profileIcon,
              height: 18,
              width: 10,
              color: _selectedIndex == 2 ? AppColors.buttonColor : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
