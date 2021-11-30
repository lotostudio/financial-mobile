class UserModel {
  UserModel({
    required this.firstName, 
    required this.lastName, 
    required this.email,
    required this.authSucceed});

  final String firstName;
  final String lastName;
  final String email;
  final bool authSucceed;
}