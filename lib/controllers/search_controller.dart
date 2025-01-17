import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies/api/api_service.dart';
import 'package:movies/models/actor.dart';
import 'package:movies/models/movie.dart';

class SearchController1 extends GetxController {
  TextEditingController textSearchController = TextEditingController();
  var searchText = ''.obs;
  var foundActors = <Actor>[].obs;
  var isLoading = false.obs;
  void setSearchText(text) => searchText.value = text;
  void search(String query) async {
    isLoading.value = true;
    foundActors.value = (await ApiService.getSearchedActors(query)) ?? [];
    isLoading.value = false;
  }
}
