class HomeModel {
  List<Data>? data;
  String? page;
  String? perPage;
  int? total;

  HomeModel({this.data, this.page, this.perPage, this.total});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    page = json['page'];
    perPage = json['perPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['perPage'] = this.perPage;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? activityId;
  String? title;
  String? description;
  int? createdBy;
  String? createdAt;
  String? image;
  String? pathFile;
  String? userNumber;
  String? name;
  String? familyName;

  Data(
      {this.activityId,
      this.title,
      this.description,
      this.createdBy,
      this.createdAt,
      this.image,
      this.pathFile,
      this.userNumber,
      this.name,
      this.familyName});

  Data.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    image = json['image'];
    pathFile = json['path_file'];
    userNumber = json['user_number'];
    name = json['name'];
    familyName = json['familyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity_id'] = this.activityId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;
    data['path_file'] = this.pathFile;
    data['user_number'] = this.userNumber;
    data['name'] = this.name;
    data['familyName'] = this.familyName;
    return data;
  }
}
