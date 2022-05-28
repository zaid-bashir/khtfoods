class AlbumSec {
  final String otp;
  final String phone;
  final String countryCode;

  AlbumSec({this.otp, this.phone, this.countryCode});

  factory AlbumSec.fromJson(Map<String, dynamic> json) {
    return AlbumSec(
        otp: json["otp"],
        phone: json["phone"],
        countryCode: json["countryCode"]);
  }
}
