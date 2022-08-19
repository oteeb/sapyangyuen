class RegisterMode {

  String? name;
  String? familyName;
  int? phone;
  int? cardId;
  String? houseNumber;
  String? amphur;
  String? district;
  String? province;
  String? postcode;

  RegisterMode(
      {
      this.name,
      this.familyName,
      this.phone,
      this.cardId,
      this.houseNumber,
      this.amphur,
      this.district,
      this.province,
      this.postcode,
});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['familyName'] = this.familyName;
    data['phone'] = this.phone;
    data['card_id'] = this.cardId;
    data['house_number'] = this.houseNumber;
    data['amphur'] = this.amphur;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    return data;
  }
}
