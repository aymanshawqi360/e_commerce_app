import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/widgets/app_svg_view.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _clearText() {
    _controller.clear();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, value, child) {
          bool hasText = _controller.text.isNotEmpty;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.08),
                    blurRadius: 8
                  )
                ],
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Find your favorite items",
                  prefixIconConstraints: const BoxConstraints(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: AppSvgView(assetName: AssetsManager.searchIcon, width: 24, height: 24,),
                  ),
                  suffixIcon: IconButton(
                    icon: AppSvgView(
                      assetName : hasText ? AssetsManager.cancelCircle : AssetsManager.searchVisual,
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      if (hasText) {
                        _clearText();
                      } else {

                      }
                    },
                  ),
                  filled: true,
                  fillColor: ColorsManager.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xff4F48FF)),
                  ),

                ),

              ),
            ),
          );
        },
      ),
    );
  }
}
