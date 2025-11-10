import 'package:e_commerce_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              HomeAppBar(),
              SearchBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
