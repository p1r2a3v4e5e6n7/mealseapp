import 'package:apisapp/api_services_call/api_services.dart';
import 'package:apisapp/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServicesProvider = Provider<ApiServicesCall>((ref) {
  return ApiServicesCall();
});

final apiStateNotifierProvider =
    StateNotifierProvider<ApiStateNotifier, AsyncValue<List<User>>>((ref) {
  return ApiStateNotifier(ref.read(apiServicesProvider));
});

class ApiStateNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final ApiServicesCall apiServices;
  bool isDataLoaded = false;
  ApiStateNotifier(this.apiServices) : super(AsyncValue.loading()) {
    fetchUsers();
  }
  Future<void> fetchUsers() async {
    if (isDataLoaded) return;
    try {
      final users = await apiServices.getRequest('users');

      state = AsyncValue.data(users);
      isDataLoaded = true;
    } catch (e, stackTrace) {}
  }
}
