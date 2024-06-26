import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_services/api_services_class.dart';
import '../api_services/db_services.dart';
import '../models/user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final userListProvider =
    StateNotifierProvider<UserController, AsyncValue<List<User>>>((ref) {
  return UserController(ref.read(apiServiceProvider));
});

class UserController extends StateNotifier<AsyncValue<List<User>>> {
  final ApiService apiService;
  final DatabaseService dbService = DatabaseService();
  bool isDataLoaded = false;

  UserController(this.apiService) : super(const AsyncValue.loading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (isDataLoaded) return;
    try {
      final users = await apiService.getUsers();
      state = AsyncValue.data(users);
      isDataLoaded = true;
    } catch (e, stackTrace) {
      final offlineUsers = await dbService.getUsers();
      state = AsyncValue.data(offlineUsers);
    }
  }

  Future<void> refreshUsers() async {
    try {
      final users = await apiService.getUsers();
      state = AsyncValue.data(users);
    } catch (e, stackTrace) {
      final offlineUsers = await dbService.getUsers();
      state = AsyncValue.data(offlineUsers);
    }
  }

  Future<void> addUser(User user) async {
    try {
      final newUser = await apiService.createUser(user);
      state.whenData((users) => state = AsyncValue.data([...users, newUser]));
      await dbService.insertUser(newUser);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> updateUser(User user) async {
    try {
      final updatedUser = await apiService.updateUser(user);
      state.whenData((users) {
        final index = users.indexWhere((u) => u.id == user.id);
        if (index != -1) {
          final updatedList = [...users];
          updatedList[index] = updatedUser;
          state = AsyncValue.data(updatedList);
        }
      });
      await dbService.updateUser(user);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await apiService.deleteUser(id);
      state.whenData((users) =>
          state = AsyncValue.data(users.where((u) => u.id != id).toList()));
      await dbService.deleteUser(id);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
