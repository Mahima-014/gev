import 'package:flutter/cupertino.dart';

class MobileUserDetails {
  int _userId;
  String _visitType;
  String _checkInDate;
  String _checkOutDate;
  String _checkInCode;
  int _additionalMember;
  String _deviceId;
  String _deviceName;
  String _createDate;
  String _createdBy;
  String _lastModifiedDate;
  String _lastModifiedBy;

  MobileUserDetails(
      [this._userId,
      this._visitType,
      this._checkInDate,
      this._checkOutDate,
      this._checkInCode,
      this._additionalMember,
      this._deviceId,
      this._deviceName,
      this._createDate,
      this._createdBy,
      this._lastModifiedDate,
      this._lastModifiedBy]);

  int get userId => _userId;

  String get visitType => _visitType;

  String get checkInDate => _checkInDate;

  String get checkOutDate => _checkOutDate;

  String get checkInCode => _checkInCode;

  int get additionalMember => _additionalMember;

  set visitType(String value) {
    _visitType = value;
  }

  String get deviceId => _deviceId;

  String get deviceName => _deviceName;

  String get createDate => _createDate;

  String get createdBy => _createdBy;

  String get lastModifiedDate => _lastModifiedDate;

  String get lastModifiedBy => _lastModifiedBy;

  set checkInDate(String value) {
    _checkInDate = value;
  }

  set lastModifiedBy(String value) {
    _lastModifiedBy = value;
  }

  set lastModifiedDate(String value) {
    _lastModifiedDate = value;
  }

  set createdBy(String value) {
    _createdBy = value;
  }

  set createDate(String value) {
    _createDate = value;
  }

  set deviceName(String value) {
    _deviceName = value;
  }

  set deviceId(String value) {
    _deviceId = value;
  }

  set additionalMember(int value) {
    _additionalMember = value;
  }

  set checkInCode(String value) {
    _checkInCode = value;
  }

  set checkOutDate(String value) {
    _checkOutDate = value;
  }

  MobileUserDetails.fromJson(Map<String, dynamic> json)
      : _userId = json['user_id'],
        _visitType = json['visit_type'],
        _checkInDate = json['check_in_date'],
        _checkOutDate = json['check_out_date'],
        _checkInCode = json['check_in_code'],
        _additionalMember = json['additional_member'],
        _deviceId = json['device_id'],
        _deviceName = json['device_name'],
        _createDate = json['create_date'],
        _createdBy = json['created_by'],
        _lastModifiedDate = json['last_modified_date'],
        _lastModifiedBy = json['last_modified_by'];

  Map<String, dynamic> toJson() => {
        'user_id': _userId,
        'visit_type': _visitType,
        'check_in_date': _checkInDate,
        'check_out_date': _checkOutDate,
        'check_in_code': _checkInCode,
        'additional_member': _additionalMember,
        'device_id': _deviceId,
        'device_name': _deviceName,
        'create_date': _createDate,
        'created_by': _createdBy,
        'last_modified_date': _lastModifiedDate,
        'last_modified_by': _lastModifiedBy,
      };
}
