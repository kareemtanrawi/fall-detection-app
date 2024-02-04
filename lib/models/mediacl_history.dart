class MedicalHistory {
  final int userId;
  final String medicalCondition;

  MedicalHistory({required this.userId, required this.medicalCondition});

  factory MedicalHistory.fromJson(Map<String, dynamic> json) {
    return MedicalHistory(
      userId: json['userId'],
      medicalCondition: json['medicalCondition'],
    );
  }
}
