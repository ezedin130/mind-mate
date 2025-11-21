class MonthlyTrend {
  final String month;
  final double average;

  const MonthlyTrend({
    required this.month,
    required this.average,
  });
  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'average': average,
    };
  }

  factory MonthlyTrend.fromJson(Map<String, dynamic> json) {
    return MonthlyTrend(
      month: json['month'],
      average: json['average'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MonthlyTrend &&
              runtimeType == other.runtimeType &&
              month == other.month &&
              average == other.average;

  @override
  int get hashCode => month.hashCode ^ average.hashCode;
}