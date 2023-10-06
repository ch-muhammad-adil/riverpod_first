class Counter {
  final int? value;

  Counter({this.value});

  @override
  String toString() {
    return 'Counter{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Counter &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'value': this.value,
    };
  }

  factory Counter.fromMap(Map<String, dynamic> map) {
    return Counter(
      value: map['value'] as int,
    );
  }
}
