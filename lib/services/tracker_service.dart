import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import '../models/dclone_status.dart';
import '../models/terror_zone.dart';

class TrackerService {
  static final _random = Random();

  // ─── DClone API ───────────────────────────────────────────────────────────
  // Live data sourced from the community-powered diablo2.io tracker API.
  // Docs: https://diablo2.io – endpoint: /dclone_api.php
  static const _dcloneApiBase = 'https://diablo2.io/dclone_api.php';

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    // Force plain string response — we'll decode manually to avoid
    // Dio's auto-cast failing on Android release builds.
    responseType: ResponseType.plain,
  ));

  /// Fetches live DClone progress from diablo2.io and returns all rows
  /// sorted by region order Americas → Europe → Asia, then by progress desc.
  Future<List<DCloneStatus>> fetchDCloneStatuses() async {
    final response = await _dio.get<String>(
      _dcloneApiBase,
      queryParameters: {'sk': 'p', 'sd': 'd'},
    );

    final body = response.data ?? '[]';
    final decoded = jsonDecode(body);

    if (decoded is! List) {
      throw FormatException('Unexpected API response format: $body');
    }

    final statuses = decoded
        .whereType<Map<String, dynamic>>()
        .map(DCloneStatus.fromJson)
        .toList();

    // Secondary sort: region order Americas → Europe → Asia, then by progress desc.
    const regionOrder = {'Americas': 0, 'Europe': 1, 'Asia': 2};
    statuses.sort((a, b) {
      final regionCmp =
          (regionOrder[a.region] ?? 9).compareTo(regionOrder[b.region] ?? 9);
      if (regionCmp != 0) return regionCmp;
      return b.progress.compareTo(a.progress);
    });

    return statuses;
  }

  static const _allTerrorZones = [
    // Act 1
    TerrorZone(name: 'Blood Moor & Den of Evil', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Cold Plains & The Cave', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Burial Grounds & Crypt & Mausoleum', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Stony Field', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Dark Wood', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'The Forgotten Tower', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Jail', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Cathedral & Catacombs', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'The Pit', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Tristram', act: 'Act I', actNumber: 1, areaLevel: 85),
    TerrorZone(name: 'Moo Moo Farm', act: 'Act I', actNumber: 1, areaLevel: 85),
    // Act 2
    TerrorZone(name: 'Sewers', act: 'Act II', actNumber: 2, areaLevel: 85),
    TerrorZone(name: 'Rocky Waste & Stony Tomb', act: 'Act II', actNumber: 2, areaLevel: 85),
    TerrorZone(name: 'Dry Hills & Halls of the Dead', act: 'Act II', actNumber: 2, areaLevel: 85),
    TerrorZone(name: 'Far Oasis', act: 'Act II', actNumber: 2, areaLevel: 85),
    TerrorZone(name: 'Lost City & Valley of Snakes & Claw Viper Temple', act: 'Act II', actNumber: 2, areaLevel: 85),
    TerrorZone(name: 'Ancient Tunnels', act: 'Act II', actNumber: 2, areaLevel: 85),
    TerrorZone(name: 'Tal Rasha\'s Tombs', act: 'Act II', actNumber: 2, areaLevel: 85),
    TerrorZone(name: 'Arcane Sanctuary', act: 'Act II', actNumber: 2, areaLevel: 85),
    // Act 3
    TerrorZone(name: 'Spider Forest & Spider Cavern', act: 'Act III', actNumber: 3, areaLevel: 85),
    TerrorZone(name: 'Flayer Jungle & Flayer Dungeon', act: 'Act III', actNumber: 3, areaLevel: 85),
    TerrorZone(name: 'Kurast Bazaar & Temples', act: 'Act III', actNumber: 3, areaLevel: 85),
    TerrorZone(name: 'Travincal', act: 'Act III', actNumber: 3, areaLevel: 85),
    TerrorZone(name: 'Durance of Hate', act: 'Act III', actNumber: 3, areaLevel: 85),
    // Act 4
    TerrorZone(name: 'Outer Steppes & Plains of Despair', act: 'Act IV', actNumber: 4, areaLevel: 85),
    TerrorZone(name: 'River of Flame & City of the Damned', act: 'Act IV', actNumber: 4, areaLevel: 85),
    TerrorZone(name: 'Chaos Sanctuary', act: 'Act IV', actNumber: 4, areaLevel: 85),
    // Act 5
    TerrorZone(name: 'Bloody Foothills & Frigid Highlands & Abaddon', act: 'Act V', actNumber: 5, areaLevel: 85),
    TerrorZone(name: 'Glacial Trail & Drifter Cavern', act: 'Act V', actNumber: 5, areaLevel: 85),
    TerrorZone(name: 'Crystalline Passage & Frozen River', act: 'Act V', actNumber: 5, areaLevel: 85),
    TerrorZone(name: 'Arreat Plateau & Pit of Acheron', act: 'Act V', actNumber: 5, areaLevel: 85),
    TerrorZone(name: 'Nihlathak\'s Temple & Halls of Vaught', act: 'Act V', actNumber: 5, areaLevel: 85),
    TerrorZone(name: 'Ancientsway & Icy Cellar', act: 'Act V', actNumber: 5, areaLevel: 85),
    TerrorZone(name: 'Worldstone Keep', act: 'Act V', actNumber: 5, areaLevel: 85),
  ];

  // ─── Terror Zone (still simulated – no public TZ API available) ──────────

  List<TerrorZone> getCurrentTerrorZones() {
    final now = DateTime.now();
    final shuffled = List<TerrorZone>.from(_allTerrorZones)..shuffle(_random);

    final current = shuffled[0].copyWith(
      isCurrent: true,
      startTime: now.subtract(Duration(minutes: _random.nextInt(50) + 10)),
      endTime: now.add(Duration(minutes: _random.nextInt(40) + 20)),
    );

    final next = shuffled[1].copyWith(
      isCurrent: false,
      startTime: current.endTime,
      endTime: current.endTime?.add(const Duration(hours: 1)),
    );

    return [current, next];
  }

  List<TerrorZone> getRecentTerrorZones() {
    final now = DateTime.now();
    final shuffled = List<TerrorZone>.from(_allTerrorZones)..shuffle(_random);
    return List.generate(
      8,
      (i) => shuffled[i + 2].copyWith(
        startTime: now.subtract(Duration(hours: i + 1)),
        endTime: now.subtract(Duration(hours: i)),
      ),
    );
  }
}
