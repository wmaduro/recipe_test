import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/controller/recipe_detail_controller.dart';
import 'package:recipe_test/context/recipe-list/controller/recipe_list_controller.dart';
import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:recipe_test/shared/components/body_generic.dart';
import 'package:recipe_test/shared/components/my_card.dart';
import 'package:rx_notifier/rx_notifier.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);
  @override
  RecipeDetailPageState createState() => RecipeDetailPageState();
}

class RecipeDetailPageState extends State<RecipeDetailPage> {
  final recipeDetailController = Modular.get<RecipeDetailController>();

  // @override
  // void initState() {
  //   super.initState();

  //   recipeDetailController.refresh();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        title: Text('teste'),
        backgroundColor: ColorsUtil.appBarBackground,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.fastfood_outlined),
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(child: RxBuilder(builder: (_) {
      return Text('teste........');
    }));
  }
}
