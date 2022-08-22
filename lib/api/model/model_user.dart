class User_Model {
  Data? data;

  User_Model({this.data});

  User_Model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<User>? user;
  int? iat;

  Data({this.user, this.iat});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    iat = json['iat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['iat'] = this.iat;
    return data;
  }
}

class User {
  int? userId;
  String? userNumber;
  String? username;
  String? password;
  String? name;
  String? familyName;
  String? phone;
  Null? cardId;
  Null? houseNumber;
  Null? amphur;
  Null? district;
  Null? province;
  Null? postcode;
  Null? fulladdress;
  int? isActive;
  Null? createdAt;
  Null? updatedAt;
  String? role;
  String? loginBy;
  int? activate;
  Null? profileImage;

  User(
      {this.userId,
      this.userNumber,
      this.username,
      this.password,
      this.name,
      this.familyName,
      this.phone,
      this.cardId,
      this.houseNumber,
      this.amphur,
      this.district,
      this.province,
      this.postcode,
      this.fulladdress,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.role,
      this.loginBy,
      this.activate,
      this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userNumber = json['user_number'];
    username = json['username'];
    password = json['password'];
    name = json['name'];
    familyName = json['familyName'];
    phone = json['phone'];
    cardId = json['card_id'];
    houseNumber = json['house_number'];
    amphur = json['amphur'];
    district = json['district'];
    province = json['province'];
    postcode = json['postcode'];
    fulladdress = json['fulladdress'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    loginBy = json['login_by'];
    activate = json['activate'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_number'] = this.userNumber;
    data['username'] = this.username;
    data['password'] = this.password;
    data['name'] = this.name;
    data['familyName'] = this.familyName;
    data['phone'] = this.phone;
    data['card_id'] = this.cardId;
    data['house_number'] = this.houseNumber;
    data['amphur'] = this.amphur;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    data['fulladdress'] = this.fulladdress;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role'] = this.role;
    data['login_by'] = this.loginBy;
    data['activate'] = this.activate;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
