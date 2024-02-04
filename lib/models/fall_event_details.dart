class FallEventDetails {
  final int fallEventId;
  final int accelerometerX;
  final int accelerometerY;
  final int accelerometerZ;

  FallEventDetails({
    required this.fallEventId,
    required this.accelerometerX,
    required this.accelerometerY,
    required this.accelerometerZ,
  });

  factory FallEventDetails.fromJson(Map<String, dynamic> json) {
    return FallEventDetails(
      fallEventId: json['fallEventId'],
      accelerometerX: json['accelerometerX'],
      accelerometerY: json['accelerometerY'],
      accelerometerZ: json['accelerometerZ'],
    );
  }
}
