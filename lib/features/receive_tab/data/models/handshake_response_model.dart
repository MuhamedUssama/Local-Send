enum HandshakeDecision { accepted, rejected, busy, insufficientStorage }

class HandshakeResponseModel {
  final String sessionId;
  final HandshakeDecision decision;
  final String? message;
  final List<String>? acceptedFileIds;

  const HandshakeResponseModel({
    required this.sessionId,
    required this.decision,
    this.message,
    this.acceptedFileIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'decision': decision.name,
      'message': message,
      'acceptedFileIds': acceptedFileIds,
    };
  }

  factory HandshakeResponseModel.fromMap(Map<String, dynamic> map) {
    final rawDecision = map['decision'] as String;
    return HandshakeResponseModel(
      sessionId: map['sessionId'] as String,
      decision: HandshakeDecision.values.firstWhere(
        (d) => d.name == rawDecision,
        orElse: () => HandshakeDecision.rejected,
      ),
      message: map['message'] as String?,
      acceptedFileIds: (map['acceptedFileIds'] as List<dynamic>?)
          ?.cast<String>(),
    );
  }
}
