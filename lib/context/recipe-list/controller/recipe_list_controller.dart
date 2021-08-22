import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';
import 'package:recipe_test/context/recipe-list/repository/recipe_list_repository.dart';
import 'package:rx_notifier/rx_notifier.dart';

enum RecipeListControllerStatus {
  PROCESSING,
  SUCCESS,
  ERROR,
}

class RecipeListController {
  final RecipeListRepository _recipeListRepository;
  final _rxRecipeDTOList = RxList<RecipeDTO>([]);
  List<RecipeDTO> get rxRecipeDTOList => _rxRecipeDTOList.toList();

  RecipeListController(this._recipeListRepository);

  var _rxMyPlansControllerStatus = RxNotifier<RecipeListControllerStatus>(
      RecipeListControllerStatus.PROCESSING);
  RecipeListControllerStatus get myPlansControllerStatus =>
      _rxMyPlansControllerStatus.value;

  refresh() async {
    _rxMyPlansControllerStatus.value = RecipeListControllerStatus.PROCESSING;

    _rxRecipeDTOList.clear();

    _recipeListRepository.getAllRecipies().then((recipeList) {
      _rxRecipeDTOList.addAll(recipeList.recipes);
      _rxMyPlansControllerStatus.value = RecipeListControllerStatus.SUCCESS;
    });
  }
}
