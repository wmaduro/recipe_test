import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-list/controller/recipe_list_controller.dart';
import 'package:recipe_test/context/recipe-list/view/recipe_list_page.dart';
import 'package:recipe_test/shared/components/my_card.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:recipe_test/context/recipe-list/view/recipe_list_page_card_content.dart';

extension RecipeListPageStateBodySuccess on RecipeListPageState {
  bodySuccess(
    RecipeListController recipeListController,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          RxBuilder(builder: (_) {
            return Expanded(
                child: RefreshIndicator(
                    onRefresh: () async {
                      recipeListController.refresh();
                    },
                    child: ListView.builder(
                      itemCount: recipeListController.rxRecipeDTOList.length,
                      itemBuilder: (_, id) {
                        final recipeDTO =
                            recipeListController.rxRecipeDTOList[id];

                        return GestureDetector(
                          onTap: () =>
                              recipeListController.showDetail(recipeDTO),
                          child: myCard(
                            cardContent: cardContent(recipeDTO),
                          ),
                        );
                      },
                    )));
          })
        ],
      ),
    );
  }
}
