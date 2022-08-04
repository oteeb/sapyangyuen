import 'dart:convert';

List<ModelProvince> modelProvinceFromJson(String str) => List<ModelProvince>.from(json.decode(str).map((x) => ModelProvince.fromJson(x)));

String modelProvinceToJson(List<ModelProvince> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelProvince {
    ModelProvince({
        this.id,
        this.nameTh,
        this.nameEn,
        this.geographyId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    String? nameTh;
    String? nameEn;
    int? geographyId;
    String? createdAt;
    String? updatedAt;
    dynamic deletedAt;

    factory ModelProvince.fromJson(Map<String, dynamic> json) => ModelProvince(
        id: json["id"],
        nameTh: json["name_th"],
        nameEn: json["name_en"],
        geographyId: json["geography_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_th": nameTh,
        "name_en": nameEn,
        "geography_id": geographyId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}




// class ModelProvince {
//   int? id;
//   String? nameTh;
//   String? nameEn;
//   int? geographyId;
//   String? createdAt;
//   String? updatedAt;
//   Null? deletedAt;

//   ModelProvince(
//       {this.id,
//       this.nameTh,
//       this.nameEn,
//       this.geographyId,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});

//   ModelProvince.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameTh = json['name_th'];
//     nameEn = json['name_en'];
//     geographyId = json['geography_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name_th'] = this.nameTh;
//     data['name_en'] = this.nameEn;
//     data['geography_id'] = this.geographyId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     return data;
//   }
// }
