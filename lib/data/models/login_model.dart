class LoginModel {
  LoginModel({
    this.refresh,
    this.access,
  });

  String refresh;
  String access;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
