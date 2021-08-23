import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';

extension RecipeDetailPageStateShowHeader on RecipeDetailPageState {
  showHeader(String? imageUrl, String? name) {
    var imageHeight = MediaQuery.of(context).size.height * .23;
    var imageWidth = MediaQuery.of(context).size.width;

    var nameWidth = imageWidth * .55;
    var nameFontSize = imageWidth * .048;

    var bottomPosition = 13.0;
    var leftPosition = 15.0;

    return Container(
        height: imageHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl ?? ''),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                    height: imageHeight * 1.20,
                    width: imageWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                            'assets/images/background-gradient-black.png'),
                      ),
                    ))),
            Positioned(
              bottom: bottomPosition,
              left: leftPosition,
              child: SizedBox(
                width: nameWidth,
                child: Text(name ?? '',
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style:
                        TextStyle(fontSize: nameFontSize, color: Colors.white)),
              ),
            ),
          ],
        ));
  }
}
