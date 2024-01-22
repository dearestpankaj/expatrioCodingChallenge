import 'package:equatable/equatable.dart';

class TexDetailModel extends Equatable {
  bool? usPerson;
  String? usTaxId;
  PrimaryTaxResidence? primaryTaxResidence;
  List<PrimaryTaxResidence>? secondaryTaxResidence;
  int? w9FileId;
  W9File? w9File;

  TexDetailModel(
      {this.usPerson,
      this.usTaxId,
      this.primaryTaxResidence,
      this.secondaryTaxResidence,
      this.w9FileId,
      this.w9File});

  TexDetailModel.fromJson(Map<String, dynamic> json) {
    usPerson = json['usPerson'];
    usTaxId = json['usTaxId'];
    primaryTaxResidence = json['primaryTaxResidence'] != null
        ? PrimaryTaxResidence.fromJson(json['primaryTaxResidence'])
        : null;
    if (json['secondaryTaxResidence'] != null) {
      secondaryTaxResidence = <PrimaryTaxResidence>[];
      json['secondaryTaxResidence'].forEach((v) {
        secondaryTaxResidence!.add(PrimaryTaxResidence.fromJson(v));
      });
    }
    w9FileId = json['w9FileId'];
    w9File = json['w9File'] != null ? W9File.fromJson(json['w9File']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usPerson'] = usPerson;
    data['usTaxId'] = usTaxId;
    if (primaryTaxResidence != null) {
      data['primaryTaxResidence'] = primaryTaxResidence!.toJson();
    }
    if (secondaryTaxResidence != null) {
      data['secondaryTaxResidence'] =
          secondaryTaxResidence!.map((v) => v.toJson()).toList();
    }
    data['w9FileId'] = w9FileId;
    if (w9File != null) {
      data['w9File'] = w9File!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [];
}

class PrimaryTaxResidence {
  String? country;
  String? id;

  PrimaryTaxResidence({this.country, this.id});

  PrimaryTaxResidence.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['id'] = id;
    return data;
  }
}

class W9File extends Equatable {
  int? id;
  String? createdAt;
  String? modifiedAt;
  String? fileName;
  String? dataType;
  String? author;
  String? state;
  String? field;
  String? label;
  String? description;
  String? fileUrl;
  bool? invalid;

  W9File(
      {this.id,
      this.createdAt,
      this.modifiedAt,
      this.fileName,
      this.dataType,
      this.author,
      this.state,
      this.field,
      this.label,
      this.description,
      this.fileUrl,
      this.invalid});

  W9File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    fileName = json['fileName'];
    dataType = json['dataType'];
    author = json['author'];
    state = json['state'];
    field = json['field'];
    label = json['label'];
    description = json['description'];
    fileUrl = json['fileUrl'];
    invalid = json['invalid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    data['fileName'] = fileName;
    data['dataType'] = dataType;
    data['author'] = author;
    data['state'] = state;
    data['field'] = field;
    data['label'] = label;
    data['description'] = description;
    data['fileUrl'] = fileUrl;
    data['invalid'] = invalid;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
