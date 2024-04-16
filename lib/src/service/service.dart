import 'package:dio/dio.dart';
import '../components/dog_model.dart';
import '../components/film_model.dart';
import '../config/comfig.dart';

final dio = Dio();

class ApiService{
  Future<FilmsModel?>? fetchFilmsData() async {

    final response = await dio.get(
      AppConfig.baseUrl,
      queryParameters: {
        "q": "tesla",
        "from": "2024-04-10",
        "sortBy": "publishedAt",
      },
      options: Options(
        headers: {
          "X-Api-Key": "35814a1034d843b5900ee3aff6293903",
          "Authorization": "35814a1034d843b5900ee3aff6293903",
        }
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201){
      return FilmsModel.fromJson(response.data ?? {});
    }else{
      return null;
    }
  }
}


//
// class DogService{
//   Future<DogApi?>? dogFetchData() async{
//     final dogresponse = await dio.get(
//         DogConfig.dogBaseUrl,
//     );
//     if (dogresponse.statusCode == 200 || dogresponse.statusCode == 201){
//       return DogApi.fromJson(dogresponse.data ?? {});
//     }else{
//       return null;
//     }
//
//   }
// }