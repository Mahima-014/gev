import 'package:flutter/cupertino.dart';

class MobileUserDetails {
  int userId;
  String visitType;
  String checkInDate;
  String checkOutDate;
  String checkInCode;
  int additionalMember;
  String deviceId;
  String deviceName;
  String createDate;
  String createdBy;
  String lastModifiedDate;
  String lastModifiedBy;

  MobileUserDetails(
      [this.userId,
      this.visitType,
      this.checkInDate,
      this.checkOutDate,
      this.checkInCode,
      this.additionalMember,
      this.deviceId,
      this.deviceName,
      this.createDate,
      this.createdBy,
      this.lastModifiedDate,
      this.lastModifiedBy]);



  MobileUserDetails.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        visitType = json['visit_type'],
        checkInDate = json['check_in_date'],
        checkOutDate = json['check_out_date'],
        checkInCode = json['check_in_code'],
        additionalMember = json['additional_member'],
        deviceId = json['device_id'],
        deviceName = json['device_name'],
        createDate = json['create_date'],
        createdBy = json['created_by'],
        lastModifiedDate = json['last_modified_date'],
        lastModifiedBy = json['last_modified_by'];

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'visit_type': visitType,
        'check_in_date': checkInDate,
        'check_out_date': checkOutDate,
        'check_in_code': checkInCode,
        'additional_member': additionalMember,
        'device_id': deviceId,
        'device_name': deviceName,
        'create_date': createDate,
        'created_by': createdBy,
        'last_modified_date': lastModifiedDate,
        'last_modified_by': lastModifiedBy,
      };
}
