class Notification {
  final int fallEventID;
  final String notificationTimestamp;
  final String notificationStatus;

  Notification({
    required this.fallEventID,
    required this.notificationTimestamp,
    required this.notificationStatus,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      fallEventID: json['fallEventID'],
      notificationTimestamp: json['notificationTimestamp'],
      notificationStatus: json['notificationStatus'],
    );
  }
}
