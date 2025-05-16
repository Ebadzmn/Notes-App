class UserModel {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? photo;

  UserModel({required this.email, required this.firstName, required this.lastName, required this.mobile, this.photo});


  factory UserModel.fromJson(Map<String,dynamic> jsonData) {
    return UserModel (
      firstName: jsonData['first_name'] ?? 'Unknown',
      lastName: jsonData['last_name'] ?? '',
      email: jsonData['email'],
      mobile: jsonData['phone'] ?? '',
      photo: jsonData['avatar_url'] ?? ''
    );
  }

  Map<String , dynamic> toJson() {
    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'mobile' : mobile,
      'photo' : photo,
      'email' : email,
    };
  }
}