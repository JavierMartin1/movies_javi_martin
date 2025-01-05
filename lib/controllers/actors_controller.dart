import 'package:get/get.dart';
import 'package:movies/api/api_service.dart';
import 'package:movies/models/actor.dart';

class ActorsController extends GetxController {
  var isLoading = false.obs;
  var mainPopularActors = <Actor>[].obs;
  var favouriteListActors = <Actor>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    mainPopularActors.value = (await ApiService.getMainPopularActors())!;
    isLoading.value = false;
    super.onInit();
  }

  bool isInFavouriteList(Actor actor) {
    return favouriteListActors.any((m) => m.id == actor.id);
  }

  void addToFavouriteList(Actor actor) {
    if (favouriteListActors.any((m) => m.id == actor.id)) {
      favouriteListActors.remove(actor);
      Get.snackbar('Success', 'removed from favourite list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds: 1000));
    } else {
      favouriteListActors.add(actor);
      Get.snackbar('Success', 'added to favourite list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds: 1000));
    }
  }
}
