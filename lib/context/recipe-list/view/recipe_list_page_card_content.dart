import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';
import 'package:recipe_test/context/recipe-list/view/recipe_list_page.dart';

extension RecipeListPageStateCardContent on RecipeListPageState {
  cardContent(
    RecipeDTO recipeDTO,
  ) {
    var cardHeight = MediaQuery.of(context).size.height * .23;
    var cardWidth = MediaQuery.of(context).size.width;
    var nameWidth = cardWidth * .55;
    var nameFontSize = cardWidth * .048;
    var timeFontSize = cardWidth * .033;

    var bottomPosition = 13.0;
    var leftPosition = 15.0;
    var distanceBetweenClockAndTime = 5.0;

    return Container(
        height: cardHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(recipeDTO.imageUrl ?? ''),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                    height: cardHeight * 1.20,
                    width: cardWidth,
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
                child: Text(recipeDTO.name ?? '',
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style:
                        TextStyle(fontSize: nameFontSize, color: Colors.white)),
              ),
            ),
            Positioned(
                bottom: bottomPosition,
                right: leftPosition,
                child: Row(children: [
                  Icon(
                    Icons.watch_later,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: distanceBetweenClockAndTime,
                  ),
                  Text('${recipeDTO.getTotalTime()} Minutes',
                      style: TextStyle(
                          fontSize: timeFontSize, color: Colors.white)),
                ])),
          ],
        ));
  }
}
