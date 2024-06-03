import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/views/pages/home_page.dart';
import 'package:food_delivery/views/pages/favorites_page.dart';
import 'package:food_delivery/views/pages/profile_page.dart';
import 'package:food_delivery/views/widgets/app_drawer.dart';
import 'package:food_delivery/views/widgets/custom_app_bar.dart';
import 'package:food_delivery/models/product_model.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int selectedIndex = 0;
  List<ProductModel> favoriteProducts = [];

  void updateFavorites(List<ProductModel> newFavorites) {
    setState(() {
      favoriteProducts = newFavorites;
    });
  }

  List<Widget> get bodyWidgets => [
        HomePage(
          key: const ValueKey('HomePage'),
          favoriteProducts: favoriteProducts,
          favoritesUpdated: updateFavorites,
        ),
        FavoritesPage(favoriteProducts: favoriteProducts),
        const ProfilePage(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      drawer: const AppDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: bodyWidgets[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
