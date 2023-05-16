// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Subscriber {
  final String email;

  Subscriber({
    required this.email,
  });

  Subscriber copyWith({
    String? email,
  }) {
    return Subscriber(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory Subscriber.fromMap(Map<String, dynamic> map) {
    return Subscriber(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subscriber.fromJson(String source) =>
      Subscriber.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Subscriber(email: $email)';

  @override
  bool operator ==(covariant Subscriber other) {
    if (identical(this, other)) return true;

    return other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
