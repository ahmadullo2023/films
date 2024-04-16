// class DogApi {
//   String? id;
//   String? url;
//   int? width;
//   int? height;
//
//   DogApi({this.id, this.url, this.width, this.height});
//
//   DogApi.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     url = json['url'];
//     width = json['width'];
//     height = json['height'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['url'] = url;
//     data['width'] = width;
//     data['height'] = height;
//     return data;
//   }
// }