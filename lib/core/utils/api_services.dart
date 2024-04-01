import 'package:dio/dio.dart';

class Api {
  final dio = Dio();
//............... get request ....................
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};

    Response response = await dio.get(
      url,
      options: Options(headers: headers),
    );
    print(response.data);
    return response.data;
  }
}
