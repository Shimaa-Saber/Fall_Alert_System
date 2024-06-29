class PatientModel {
  final String phone;
  final String photo;
  final String gender;
  final String name;
  final String emergency;
  final String dateOfBirth;
  List<dynamic> contactList;

  PatientModel({
    required this.dateOfBirth,
    required this.contactList,
    required this.emergency,
    required this.name,
    required this.gender,
    required this.phone,
    required this.photo,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
      emergency: json['Emergency'] ?? '',
      dateOfBirth: json['DateOfBirth'] ?? '',
      contactList: List<dynamic>.from(json['ContactList'] ?? []),
    );
  }
}
