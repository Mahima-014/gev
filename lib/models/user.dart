
class User
{
  String _userName;
  int _userPhoneCountryCode;
  int _userPhone;
  String _userEmail;
  String _userAddress;
  String _userDob;
  bool _userIsActive;
  String _createDate;
  String _createdBy;
  String _lastModifiedDate;
  String _lastModifiedBy;


  User([this._userName,this._userPhoneCountryCode,this._userPhone,this._userEmail,this._userAddress,this._userDob,this._userIsActive,this._createDate,this._lastModifiedDate, this._lastModifiedBy]);

  String get createDate => _createDate;


  String get userName => _userName;

  int get userPhoneountryCode => _userPhoneCountryCode;

  bool get userIsActive => _userIsActive;

  String get userDob => _userDob;

  String get userAddress => _userAddress;

  String get userEmail => _userEmail;

  int get userPhone => _userPhone;

  String get createdBy => _createdBy;

  String get lastModifiedDate => _lastModifiedDate;

  String get lastModifiedBy => _lastModifiedBy;


  set userIsActive(bool value) {
    _userIsActive = value;
  }

  set userDob(String value) {
    _userDob = value;
  }

  set userAddress(String value) {
    _userAddress = value;
  }

  set userEmail(String value) {
    _userEmail = value;
  }

  set userPhone(int value) {
    _userPhone = value;
  }

  set userPhoneCountryCode(int value) {
    _userPhoneCountryCode = value;
  }

  set createDate(String value) {
    _createDate = value;
  }

  set userName(String value) {
    _userName = value;
  }


  set createdBy(String value) {
    _createdBy = value;
  }

  set lastModifiedBy(String value) {
    _lastModifiedBy = value;
  }

  set lastModifiedDate(String value) {
    _lastModifiedDate = value;
  }

  User.fromJson(Map<String, dynamic> json)
      : _userName = json['user_name'],
        _userPhoneCountryCode=json['user_phone_country_code'],
  _userPhone=json['user_phone'],
        _userEmail=json['user_email'],
  _userAddress=json['user_address'],
  _userDob=json['user_dob'],
  _userIsActive=json['user_is_active'],
  _createDate=json['create_date'],
  _createdBy=json['create_by'],
  _lastModifiedDate=json['last_modified_date'],
  _lastModifiedBy=json['last_modified_by'];

  Map<String, dynamic> toJson() => {
    'user_name': _userName,
    'user_phone_country_code':_userPhoneCountryCode,
    'user_phone':_userPhone,
    'user_email':_userEmail,
    'user_address':_userAddress,
    'user_dob':_userDob,
    'user_is_active':_userIsActive,
    'create_date':_createDate,
    'create_by':_createdBy,
    'last_modified_date':_lastModifiedDate,
    'last_modified_by':_lastModifiedBy,
  };

}