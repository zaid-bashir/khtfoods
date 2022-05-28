class Album {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String role;
  final String countryCode;

  Album(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.role,
      this.countryCode});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json['email'],
        password: json["password"],
        phone: json["phone"],
        role: json["role"],
        countryCode: json["countryCode"]);
  }
}
