import 'package:dio/dio.dart';
import '../components/film_model.dart';
import '../config/comfig.dart';

final dio = Dio();

class ApiService {
  Future<FilmsModel?>? fetchFilmsData() async {
    final response = await dio.get(
      AppConfig.baseUrl,
      queryParameters: {
        "q": "tesla",
        "from": "2024-04-10",
        "sortBy": "publishedAt",
      },
      options: Options(headers: {
        "X-Api-Key": "7840203b3053405c9b71ba9a503cee4f",
        "Authorization": "7840203b3053405c9b71ba9a503cee4f",
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return FilmsModel.fromJson(response.data ?? {});
    } else {
      return null;
    }
  }
}
