// To parse this JSON data, do
//
//     final modelProvince = modelProvinceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ModelProvince>? modelProvinceFromJson(String str) => List<ModelProvince>.from(json.decode(str).map((x) => ModelProvince.fromJson(x)));

class ModelProvince {
    ModelProvince({
        @required this.id,
        @required this.nameTh,
        @required this.nameEn,
        @required this.geographyId,
        @required this.createdAt,
        @required this.updatedAt,
        @required this.deletedAt,
    });

    final int? id;
    final String? nameTh;
    final String? nameEn;
    final int? geographyId;
    final String? createdAt;
    final String? updatedAt;
    final dynamic deletedAt;

    factory ModelProvince.fromJson(Map<String, dynamic> json) => ModelProvince(
        id: json["id"] == null ? null : json["id"],
        nameTh: json["name_th"] == null ? null : json["name_th"],
        nameEn: json["name_en"] == null ? null : json["name_en"],
        geographyId: json["geography_id"] == null ? null : json["geography_id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        deletedAt: json["deleted_at"],
    );

}
