class DoctorAppointment {
  final String doctorName;
  final String appointmentDate;

  DoctorAppointment({required this.doctorName, required this.appointmentDate});
}

class DoctorImage {
  final String imagePath;

  DoctorImage({
    required this.imagePath,
  });
  factory DoctorImage.fromJson(jsonData) {
    return DoctorImage(imagePath: jsonData);
  }
}

class Doctor {
  final String name;
  final String price;
  final String rating;
  final String location;
  final String specialty;
  final String imageUrl;

  Doctor({
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.location,
    required this.specialty,
  });
  factory Doctor.formJson(jsonData) {
    return Doctor(
      price: jsonData['price'],
      name: jsonData['userName'],
      rating: jsonData['rating'],
      location: jsonData['address'],
      specialty: jsonData['specialty'],
      imageUrl: jsonData['imageUrl'],
    );
  }
}
