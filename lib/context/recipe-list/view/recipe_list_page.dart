import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-list/controller/recipe_list_controller.dart';
import 'package:recipe_test/core/config/app_context.dart';
import 'package:recipe_test/core/constants/app_constants.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:recipe_test/shared/components/body_generic.dart';
import 'package:rx_notifier/rx_notifier.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({Key? key}) : super(key: key);
  @override
  RecipeListPageState createState() => RecipeListPageState();
}

class RecipeListPageState extends State<RecipeListPage> {
  final recipeListController = Modular.get<RecipeListController>();

  @override
  void initState() {
    super.initState();
    appContext.currentContext = context;

    recipeListController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        title: Text(AppConstants.RECIPES_LIST_TITLE),
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
      switch (recipeListController.myPlansControllerStatus) {
        case RecipeListControllerStatus.ERROR:
          return Text('erro');
        // bodyErrorRefreshButtonGeneric(
        //     context: context, callback: recipeListController.refresh);
        case RecipeListControllerStatus.PROCESSING:
          return bodyProcessinGeneric();
        case RecipeListControllerStatus.SUCCESS:
          return Text(
              'success'); //bodyMyPlansSuccess(context, recipeListController);
      }
    }));
  }
}
