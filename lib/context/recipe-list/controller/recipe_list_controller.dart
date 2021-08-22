import 'package:rx_notifier/rx_notifier.dart';

enum RecipeListControllerStatus {
  PROCESSING,
  SUCCESS,
  ERROR,
}

class RecipeListController {
  // final RecipeRepository _recipeRepository;
  // final _rxRecipeDTOList = RxList<RecipeDTO>([]);
  // List<RecipeDTO> get recipeDTOList => _rxRecipeDTOList.toList();

  // RecipeListController(this._recipeRepository);

  var _rxMyPlansControllerStatus = RxNotifier<RecipeListControllerStatus>(
      RecipeListControllerStatus.PROCESSING);
  RecipeListControllerStatus get myPlansControllerStatus =>
      _rxMyPlansControllerStatus.value;

  refresh() async {
    _rxMyPlansControllerStatus.value = RecipeListControllerStatus.PROCESSING;
    // _rxRecipeDTOList.clear();
    // _recipeRepository.getRecipes().then((recipes) {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        _rxMyPlansControllerStatus.value = RecipeListControllerStatus.SUCCESS);
    // });
  }
}
