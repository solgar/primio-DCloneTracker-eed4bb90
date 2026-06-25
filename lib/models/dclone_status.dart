/// Represents one row from the diablo2.io DClone API.
///
/// API fields:
///   progress  – 1–6 (SoJ sales progress toward Uber Diablo walk)
///   region    – 1 = Americas, 2 = Europe, 3 = Asia
///   ladder    – 1 = Ladder,   2 = Non-Ladder
///   hc        – 1 = Hardcore, 2 = Softcore
///   timestamped – UNIX timestamp of the last community report
class DCloneStatus {
  /// Human-readable region name derived from the API's numeric region field.
  final String region;

  /// Human-readable ladder label, e.g. "Ladder SC" or "Non-Ladder HC".
  final String ladder;

  /// Whether this entry is Hardcore (true) or Softcore (false).
  final bool isHardcore;

  /// Whether this entry is Ladder (true) or Non-Ladder (false).
  final bool isLadder;

  /// Progress 1–6 toward Uber Diablo walk.
  final int progress;

  /// Time of the last community report (converted from UNIX timestamp).
  final DateTime lastUpdate;

  const DCloneStatus({
    required this.region,
    required this.ladder,
    required this.isHardcore,
    required this.isLadder,
    required this.progress,
    required this.lastUpdate,
  });

  /// Parse one JSON object from the diablo2.io DClone API response array.
  factory DCloneStatus.fromJson(Map<String, dynamic> json) {
    final regionNum = int.tryParse(json['region'].toString()) ?? 1;
    final ladderNum = int.tryParse(json['ladder'].toString()) ?? 1;
    final hcNum = int.tryParse(json['hc'].toString()) ?? 2;
    final progress = int.tryParse(json['progress'].toString()) ?? 1;
    final ts = int.tryParse(json['timestamped'].toString()) ?? 0;

    final regionName = switch (regionNum) {
      1 => 'Americas',
      2 => 'Europe',
      3 => 'Asia',
      _ => 'Unknown',
    };

    final isLadder = ladderNum == 1;
    final isHardcore = hcNum == 1;
    final ladderLabel =
        '${isLadder ? "Ladder" : "Non-Ladder"} ${isHardcore ? "HC" : "SC"}';

    return DCloneStatus(
      region: regionName,
      ladder: ladderLabel,
      isHardcore: isHardcore,
      isLadder: isLadder,
      progress: progress.clamp(1, 6),
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(ts * 1000),
    );
  }

  String get progressLabel {
    switch (progress) {
      case 1:
        return 'Terror gazes upon Sanctuary';
      case 2:
        return 'Terror approaches Sanctuary';
      case 3:
        return 'Terror begins to form within Sanctuary';
      case 4:
        return 'Terror spreads across Sanctuary';
      case 5:
        return 'Terror is about to be unleashed upon Sanctuary';
      case 6:
        return 'Diablo has invaded Sanctuary!';
      default:
        return 'Unknown';
    }
  }

  String get shortLabel {
    switch (progress) {
      case 1:
        return 'Gazes';
      case 2:
        return 'Approaches';
      case 3:
        return 'Forming';
      case 4:
        return 'Spreading';
      case 5:
        return 'Imminent';
      case 6:
        return 'WALKED!';
      default:
        return '???';
    }
  }
}
