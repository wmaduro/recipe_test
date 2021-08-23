import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/controller/recipe_detail_controller.dart';
import 'package:recipe_test/context/recipe-list/models/ingredient.dart';
import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:rx_notifier/rx_notifier.dart';

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
          _showHeader(
              recipeDetailController.rxRecipeDTO?.imageUrl,
              recipeDetailController.rxRecipeDTO?.name,
              recipeDetailController.rxRecipeDTO?.getTotalTime()),
          SizedBox(
            height: 5,
          ),
          _showIngredients(recipeDetailController.rxRecipeDTO?.ingredients),
          SizedBox(
            height: 5,
          ),
          _showSteps(recipeDetailController.rxRecipeDTO?.steps),
        ],
      );
    }));
  }

  _showHeader(String? imageUrl, String? name, int? totalTime) {
    return Column(children: [
      Text(
        name ?? '',
        style: TextStyle(fontSize: 25),
      ),
      Text(
        imageUrl ?? '',
        style: TextStyle(fontSize: 25),
      ),
      Text(
        '${totalTime ?? 0}',
        style: TextStyle(fontSize: 25),
      ),
    ]);
  }

  _showIngredients(List<Ingredient>? ingredients) {
    var widgetList = <Widget>[];
    ingredients?.forEach((element) {
      widgetList.add(Text('${element.quantity} ${element.name}'));
    });

    return Column(children: widgetList);
  }

  _showSteps(List? steps) {
    var widgetList = <Widget>[];
    steps?.forEach((element) {
      widgetList.add(Text('${element}'));
    });

    return Column(children: widgetList);
  }
}
