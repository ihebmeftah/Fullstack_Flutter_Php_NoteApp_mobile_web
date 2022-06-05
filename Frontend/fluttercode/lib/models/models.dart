class User {
  String? name;
  String? email;
  String? password;

  User({this.name, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'], email: json['email'], password: json['password']);
  }

  Map<String, dynamic> tojson() => {
        'name': name,
        'email': email,
        'password': password,
      };

  static List<User> listfromjson(List<dynamic> list) =>
      List<User>.from(list.map((e) => User.fromJson(e)));
}
