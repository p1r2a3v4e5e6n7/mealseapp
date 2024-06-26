import 'package:get/get.dart';

import '../api_services/api_services_class.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <User>[].obs;
  final ApiService apiService = ApiService();
  var isDataLoaded = false.obs; // Flag to track data loading state

  @override
  void onInit() {
    super.onInit();
    if (!isDataLoaded.value) {
      fetchUsers();
    }
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await apiService.getUsers();
      if (users.isNotEmpty) {
        userList.assignAll(users);
        isDataLoaded(true); // Set data loaded flag to true
      }
    } finally {
      isLoading(false);
    }
  }

  void refreshUsers() async {
    try {
      isLoading(true);
      var users = await apiService.getUsers();
      if (users.isNotEmpty) {
        userList.assignAll(users);
      }
    } finally {
      isLoading(false);
    }
  }

  void addUser(User user) async {
    try {
      isLoading(true);
      var newUser = await apiService.createUser(user);
      userList.add(newUser);
    } finally {
      isLoading(false);
    }
  }

  void updateUser(User user) async {
    try {
      isLoading(true);
      var updatedUser = await apiService.updateUser(user);
      int index = userList.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        userList[index] = updatedUser;
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteUser(int id) async {
    try {
      isLoading(true);
      await apiService.deleteUser(id);
      userList.removeWhere((u) => u.id == id);
    } finally {
      isLoading(false);
    }
  }
}
