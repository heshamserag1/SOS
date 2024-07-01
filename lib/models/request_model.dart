class RequestModelDoctor {
  String userId;
  String doctorId;
  String address;
  String message;
  String state;

  RequestModelDoctor({
    required this.userId,
    required this.doctorId,
    required this.address,
    required this.message,
    required this.state,
  });

  RequestModelDoctor.fromFireStore(Map<String, dynamic> data)
      : this(
          userId: data['userId'],
          doctorId: data['doctorId'],
          address: data['address'],
          message: data['message'],
          state: data['state'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'userId': userId,
      'doctorId': doctorId,
      'address': address,
      'message': message,
      'state': state,
    };
  }

  factory RequestModelDoctor.formJson(jsonData) {
    return RequestModelDoctor(
        userId: jsonData["userId"],
        doctorId: jsonData["doctorId"],
        address: jsonData["address"],
        message: jsonData["message"],
        state: jsonData["state"]);
  }
}

class RequestModelAssistant {
  String userId;
  String assistantId;
  String address;
  String message;
  String state;

  RequestModelAssistant({
    required this.userId,
    required this.assistantId,
    required this.address,
    required this.message,
    required this.state,
  });

  RequestModelAssistant.fromFireStore(Map<String, dynamic> data)
      : this(
          userId: data['userId'],
          assistantId: data['assistantId'],
          address: data['address'],
          message: data['message'],
          state: data['state'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'userId': userId,
      'assistantId': assistantId,
      'address': address,
      'message': message,
      'state': state,
    };
  }

  factory RequestModelAssistant.formJson(jsonData) {
    return RequestModelAssistant(
        userId: jsonData["userId"],
        assistantId: jsonData["assistantId"],
        address: jsonData["address"],
        message: jsonData["message"],
        state: jsonData["state"]);
  }
}
