import 'package:e_commerce_app/features/home/presentation/widgets/categories_section.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/my_cards_page_view.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeAppBar(),
                  const SizedBox(height: 16),
                  SearchBarWidget(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        CategoriesSection(),
                      ],
                    ),
                  ),
                  MyCardsPageView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
