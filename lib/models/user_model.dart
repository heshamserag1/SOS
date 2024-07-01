class UserModel {
  String name;
  String phone;
  String email;
  String uId;
  String imageUrl;
  String address;

  UserModel({
    this.uId = '',
    required this.email,
    required this.phone,
    required this.name,
    required this.imageUrl,
    required this.address,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
          uId: data['uId'],
          email: data['email'],
          name: data['userName'],
          phone: data['phone'],
          address: data['address'],
          imageUrl: data['imageUrl'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'email': email,
      'userName': name,
      'phone': phone,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.formJson(jsonData) {
    return UserModel(
      uId: jsonData['uId'],
      email: jsonData['email'],
      name: jsonData['userName'],
      phone: jsonData['phone'],
      imageUrl: jsonData['imageUrl'],
      address: jsonData['address'],
    );
  }
}

class UserModel2 {
  String name;
  String phone;
  String email;
  String uId;
  String address;

  UserModel2({
    required this.uId,
    required this.email,
    required this.phone,
    required this.name,
    required this.address,
  });

  factory UserModel2.formJson(jsonData) {
    return UserModel2(
      uId: jsonData['uId'],
      email: jsonData['email'],
      name: jsonData['userName'],
      phone: jsonData['phone'],
      address: jsonData['address'],
    );
  }
}

class DoctorsModel {
  String name;
  String phone;
  String email;
  String imageUrl;
  String uId;
  String address;
  String price;
  String latitude;
  String longitude;
  String rating;
  String specialty;

  DoctorsModel(
      {this.uId = '',
      required this.email,
      required this.imageUrl,
      required this.phone,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.price,
      required this.specialty,
      required this.rating});

  DoctorsModel.fromFireStore(Map<String, dynamic> data)
      : this(
          uId: data['uId'],
          email: data['email'],
          name: data['userName'],
          phone: data['phone'],
          address: data['address'],
          specialty: data['specialty'],
          price: data['price'],
          rating: data['rating'],
          latitude: data['latitude'],
          longitude: data['longitude'],
          imageUrl: data['imageUrl'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'email': email,
      'userName': name,
      'phone': phone,
      'address': address,
      'specialty': specialty,
      'price': price,
      'rating': rating,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrl': imageUrl,
    };
  }
}
