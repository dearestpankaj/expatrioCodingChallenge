import 'package:flutter/material.dart';

class Urls {
  static String baseURL = 'https://dev-api.expatrio.com';
  static String autenticateUser = '$baseURL/auth/login';
  static String userTaxDetails(String id) =>
      '$baseURL/v3/customers/$id/tax-data';
  static String userSaveTaxDetails(String id) =>
      '$baseURL/v3/customers/$id/tax-data';
}
