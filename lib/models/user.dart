class User {
  String userName;
  int userPhoneCountryCode;
  int userPhone;
  String userEmail;
  String userAddress;
  String userDob;
  bool userIsActive;
  String createDate;
  String createdBy;
  String lastModifiedDate;
  String lastModifiedBy;

  User(
      [this.userName,
      this.userPhoneCountryCode,
      this.userPhone,
      this.userEmail,
      this.userAddress,
      this.userDob,
      this.userIsActive,
      this.createDate,
      this.lastModifiedDate,
      this.lastModifiedBy]);

  User.fromJson(Map<String, dynamic> json)
      : userName = json['user_name'],
        userPhoneCountryCode = json['user_phone_country_code'],
        userPhone = json['user_phone'],
        userEmail = json['user_email'],
        userAddress = json['user_address'],
        userDob = json['user_dob'],
        userIsActive = json['user_is_active'],
        createDate = json['create_date'],
        createdBy = json['create_by'],
        lastModifiedDate = json['last_modified_date'],
        lastModifiedBy = json['last_modified_by'];

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'user_phone_country_code': userPhoneCountryCode,
        'user_phone': userPhone,
        'user_email': userEmail,
        'user_address': userAddress,
        'user_dob': userDob,
        'user_is_active': userIsActive,
        'create_date': createDate,
        'create_by': createdBy,
        'last_modified_date': lastModifiedDate,
        'last_modified_by': lastModifiedBy,
      };
}
