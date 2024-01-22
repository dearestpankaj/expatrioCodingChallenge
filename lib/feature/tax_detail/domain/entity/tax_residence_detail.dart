import 'package:equatable/equatable.dart';

class TaxResidence extends Equatable {
  String country;
  String id;
  bool isPrimary;

  TaxResidence({required this.country, required this.id, required this.isPrimary});

  @override
  List<Object?> get props {
    return [country, id];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['id'] = this.id;
    return data;
  }
}
