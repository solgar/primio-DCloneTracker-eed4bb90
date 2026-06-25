class TerrorZone {
  final String name;
  final String act;
  final int actNumber;
  final bool isCurrent;
  final DateTime? startTime;
  final DateTime? endTime;
  final List<String> monsterTypes;
  final int areaLevel;

  const TerrorZone({
    required this.name,
    required this.act,
    required this.actNumber,
    this.isCurrent = false,
    this.startTime,
    this.endTime,
    this.monsterTypes = const [],
    this.areaLevel = 85,
  });

  TerrorZone copyWith({
    String? name,
    String? act,
    int? actNumber,
    bool? isCurrent,
    DateTime? startTime,
    DateTime? endTime,
    List<String>? monsterTypes,
    int? areaLevel,
  }) =>
      TerrorZone(
        name: name ?? this.name,
        act: act ?? this.act,
        actNumber: actNumber ?? this.actNumber,
        isCurrent: isCurrent ?? this.isCurrent,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        monsterTypes: monsterTypes ?? this.monsterTypes,
        areaLevel: areaLevel ?? this.areaLevel,
      );
}
