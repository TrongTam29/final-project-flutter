import 'package:get/get.dart';
import 'package:my_app/model/user/user_model.dart';
import 'package:my_app/model/user/user_service.dart';

class UserController extends GetxController {
  Rx<User> userObj = User().obs;
  var isLoading = true.obs;

  Future<String?> findEmailUser(String account) async {
    try {
      isLoading(true);
      var user = await UserService.findUser(account);
      if (user != null) {
        return user.email;
      } else
        return 'username';
    } finally {
      isLoading(false);
    }
  }

  Future<User?> findUserById(int id) async {
    try {
      isLoading(true);
      var user = await UserService.findUserById(id);
      if (user != null) {
        return user;
      } else
        return null;
    } finally {
      isLoading(false);
    }
  }

  Future<User?> findUser(String account) async {
    try {
      isLoading(true);
      var user = await UserService.findUser(account);
      if (user != null) {
        return user;
      } else
        return null;
    } finally {
      isLoading(false);
    }
  }

  void createUser(String name, String email, String image) async {
    UserService.createUser(name, email, image);
  }
}
