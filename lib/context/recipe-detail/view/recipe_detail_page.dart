import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/controller/recipe_detail_controller.dart';
import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page_show_header.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page_show_ingredients.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page_show_steps.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page_show_time.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeDTO recipeDTO;
  const RecipeDetailPage({Key? key, required this.recipeDTO}) : super(key: key);
  @override
  RecipeDetailPageState createState() => RecipeDetailPageState();
}

class RecipeDetailPageState extends State<RecipeDetailPage> {
  final recipeDetailController = Modular.get<RecipeDetailController>();

  @override
  void initState() {
    super.initState();

    recipeDetailController.refresh(widget.recipeDTO);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        title: Text('${widget.recipeDTO.name}'),
        backgroundColor: ColorsUtil.appBarBackground,
      ),
    );
  }

  _body(BuildContext context) {
    return Container(child: RxBuilder(builder: (_) {
      return Column(
        children: [
          showHeader(
            recipeDetailController.rxRecipeDTO?.imageUrl,
            recipeDetailController.rxRecipeDTO?.name,
          ),
          SizedBox(
            height: 5,
          ),
          showTime(recipeDetailController.rxRecipeDTO?.getTotalTime()),
          SizedBox(
            height: 20,
          ),
          showIngredients(recipeDetailController.rxRecipeDTO?.ingredients),
          SizedBox(
            height: 5,
          ),
          showSteps(recipeDetailController.rxRecipeDTO?.steps),
        ],
      );
    }));
  }
}
