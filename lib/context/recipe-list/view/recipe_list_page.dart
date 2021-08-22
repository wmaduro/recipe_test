import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-list/controller/recipe_list_controller.dart';
import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';
import 'package:recipe_test/core/config/app_context.dart';
import 'package:recipe_test/core/constants/app_constants.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:recipe_test/shared/components/body_generic.dart';
import 'package:recipe_test/shared/components/my_card.dart';
import 'package:recipe_test/shared/components/my_styled_text.dart';
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
          return bodyErrorRefreshButtonGeneric(
              context: context, callback: recipeListController.refresh);
        case RecipeListControllerStatus.PROCESSING:
          return bodyProcessinGeneric();
        case RecipeListControllerStatus.SUCCESS:
          return _bodySuccess(context, recipeListController);
      }
    }));
  }

  _bodySuccess(
    BuildContext context,
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

                        return myCardWithButtomBar(
                          cardContent: _cardContent(recipeDTO),
                          // buttonBarContentList: _buttonBarContentList(
                          //   context,
                          //   planDTO,
                          //   enrollmentController,
                          // ),
                        );
                      },
                    )));
          })
        ],
      ),
    );
  }

  _cardContent(
    RecipeDTO recipeDTO,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
          child: myStyledText('<b>${recipeDTO.name}<b>',
              textStyleTag: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ))),
      // Padding(
      //   padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 12),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       myStyledText('Expiration: <b>${planDTO.formatExpirePeriod()}</b>'),
      //       myStyledText(
      //           'Number of Trips: <b>${planDTO.formatNumberOfTrips()}</b>'),
      //       myStyledText('Price: <b>${planDTO.formatPrice()}</b>'),
      //     ],
      //   ),
      // )
    ]);
  }
}
