import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

class EmployeeProps {
  static const String id = "id";
  static const String imageUrl = "imageUrl";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String email = "email";
  static const String contactNumber = "contactNumber";
  static const String age = "age";
  static const String dob = "dob";
  static const String salary = "salary";
  static const String address = "address";
}

@JsonSerializable(explicitToJson: true)
class EmployeeModel {
  @JsonKey(name: EmployeeProps.id)
  final int id;
  @JsonKey(name: EmployeeProps.imageUrl)
  final String imageUrl;
  @JsonKey(name: EmployeeProps.firstName)
  final String firstName;
  @JsonKey(name: EmployeeProps.lastName)
  final String lastName;
  @JsonKey(name: EmployeeProps.email)
  final String email;
  @JsonKey(name: EmployeeProps.contactNumber)
  final String contactNumber;
  @JsonKey(name: EmployeeProps.age)
  final int age;
  @JsonKey(name: EmployeeProps.dob)
  final String dob;
  @JsonKey(name: EmployeeProps.salary)
  final double salary;
  @JsonKey(name: EmployeeProps.address)
  final String address;

  EmployeeModel({
    required this.id,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contactNumber,
    required this.age,
    required this.dob,
    required this.salary,
    required this.address,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

  @override
  int get hashCode => id;

  @override
  String toString() => "$id";

  @override
  bool operator ==(Object other) =>
      other is EmployeeModel && other.hashCode == hashCode;
}
