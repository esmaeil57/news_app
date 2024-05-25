import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_tab.dart';
import 'package:news_app/screens/data_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedCategory != null) {
          setState(() {
            selectedCategory = null;
          });
          return false;
        } else {
          if (currentBackPressTime == null ||
              DateTime.now().difference(currentBackPressTime!) >
                  const Duration(seconds: 2)) {
            currentBackPressTime = DateTime.now();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Press back again to exit'),
              ),
            );
            return false;
          }
          return true;
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.green,
            centerTitle: true,
            shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            title: const Text(
              "News",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: selectedCategory == null
              ? CategoryTab(onClick: onCategoryClicked)
              : DataTab(
            categoryId: selectedCategory!.id,
          ),
        ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClicked(category) {
    selectedCategory = category;
    setState(() {});
  }
}
