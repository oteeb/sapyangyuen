import 'dart:convert';

List<ModelProvince> modelProvinceFromJson(String str) => List<ModelProvince>.from(json.decode(str).map((x) => ModelProvince.fromJson(x)));

String modelProvinceToJson(List<ModelProvince> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelProvince {
    ModelProvince({
        required this.id,
        required this.nameTh,
        required this.nameEn,
        required this.geographyId,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
    });

    int id;
    String nameTh;
    String nameEn;
    int geographyId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory ModelProvince.fromJson(Map<String, dynamic> json) => ModelProvince(
        id: json["id"],
        nameTh: json["name_th"],
        nameEn: json["name_en"],
        geographyId: json["geography_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_th": nameTh,
        "name_en": nameEn,
        "geography_id": geographyId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
