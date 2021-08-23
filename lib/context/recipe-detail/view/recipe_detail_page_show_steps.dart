import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';
import 'package:recipe_test/context/recipe-detail/view/utils/basic_detail_list_component.dart';

extension RecipeDetailPageStateShowSteps on RecipeDetailPageState {
  showSteps(List? steps) {
    var list = <String>[];
    steps?.forEach((element) {
      list.add('$element');
    });

    return showBasicList('Steps', list, context);
  }
}
