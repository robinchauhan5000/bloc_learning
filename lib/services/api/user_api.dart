import 'package:bloc_library/services/models/user_model.dart';
import 'package:http/http.dart';

class UserApi {
  Future<List<UserModel>> getUserList() async {
    Uri parse = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final Response response = await get(
      parse,
    );

    if (response.statusCode == 200) {
      List<UserModel> userModel = userModelFromJson(response.body);
      print(userModel[1].name);
      return userModel;
    } else {
      print("Status Code: " + response.statusCode.toString());
    }
  }
}
