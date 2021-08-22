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

                        return myCard(
                          cardContent: _cardContent(recipeDTO, context),
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
    BuildContext context,
  ) {
    var cardHeight = MediaQuery.of(context).size.height * .23;
    var cardWidth = MediaQuery.of(context).size.width;
    var nameFontSize = MediaQuery.of(context).size.width * .019;
    var timeFontSize = MediaQuery.of(context).size.width * .011;

    var bottomPosition = 15.0;
    var leftPosition = 25.0;
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
                    height: cardHeight * 1.35,
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
              child: Text(recipeDTO.name ?? '',
                  style:
                      TextStyle(fontSize: nameFontSize, color: Colors.white)),
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