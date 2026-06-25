import 'package:flutter/foundation.dart';
import '../models/dclone_status.dart';
import '../models/terror_zone.dart';
import '../services/tracker_service.dart';

enum DCloneSortOrder { progressDesc, progressAsc, region, updated }

class TrackerProvider extends ChangeNotifier {
  final TrackerService _service;

  TrackerProvider({required TrackerService service}) : _service = service {
    loadAll();
  }

  List<DCloneStatus> _dcloneStatuses = [];
  List<DCloneStatus> get dcloneStatuses => _dcloneStatuses;

  List<TerrorZone> _currentTerrorZones = [];
  List<TerrorZone> get currentTerrorZones => _currentTerrorZones;

  List<TerrorZone> _recentTerrorZones = [];
  List<TerrorZone> get recentTerrorZones => _recentTerrorZones;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Non-null when the last DClone API call failed.
  String? _dcloneError;
  String? get dcloneError => _dcloneError;

  /// Time of the most recent successful DClone data fetch.
  DateTime? _lastRefreshed;
  DateTime? get lastRefreshed => _lastRefreshed;

  // ── Filters ────────────────────────────────────────────────────────────────
  String _selectedRegion = 'All';
  String get selectedRegion => _selectedRegion;

  /// 'All' | 'HC' | 'SC'
  String _selectedHc = 'All';
  String get selectedHc => _selectedHc;

  /// 'All' | 'Ladder' | 'Non-Ladder'
  String _selectedLadder = 'All';
  String get selectedLadder => _selectedLadder;

  DCloneSortOrder _sortOrder = DCloneSortOrder.progressDesc;
  DCloneSortOrder get sortOrder => _sortOrder;

  void setRegion(String region) {
    _selectedRegion = region;
    notifyListeners();
  }

  void setHc(String hc) {
    _selectedHc = hc;
    notifyListeners();
  }

  void setLadder(String ladder) {
    _selectedLadder = ladder;
    notifyListeners();
  }

  void setSortOrder(DCloneSortOrder order) {
    _sortOrder = order;
    notifyListeners();
  }

  List<DCloneStatus> get filteredStatuses {
    var list = _dcloneStatuses.toList();

    // Region filter
    if (_selectedRegion != 'All') {
      list = list.where((s) => s.region == _selectedRegion).toList();
    }

    // HC / SC filter
    if (_selectedHc == 'HC') {
      list = list.where((s) => s.isHardcore).toList();
    } else if (_selectedHc == 'SC') {
      list = list.where((s) => !s.isHardcore).toList();
    }

    // Ladder filter
    if (_selectedLadder == 'Ladder') {
      list = list.where((s) => s.isLadder).toList();
    } else if (_selectedLadder == 'Non-Ladder') {
      list = list.where((s) => !s.isLadder).toList();
    }

    // Sort
    switch (_sortOrder) {
      case DCloneSortOrder.progressDesc:
        list.sort((a, b) => b.progress.compareTo(a.progress));
      case DCloneSortOrder.progressAsc:
        list.sort((a, b) => a.progress.compareTo(b.progress));
      case DCloneSortOrder.region:
        list.sort((a, b) => a.region.compareTo(b.region));
      case DCloneSortOrder.updated:
        list.sort((a, b) => b.lastUpdate.compareTo(a.lastUpdate));
    }

    return list;
  }

  Future<void> loadAll() async {
    _isLoading = true;
    _dcloneError = null;
    notifyListeners();

    await Future.wait([
      _fetchDClone(),
      _fetchTerrorZones(),
    ]);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    _dcloneError = null;
    notifyListeners();
    await Future.wait([
      _fetchDClone(),
      _fetchTerrorZones(),
    ]);
    notifyListeners();
  }

  Future<void> retryDClone() async {
    _dcloneError = null;
    _isLoading = _dcloneStatuses.isEmpty;
    notifyListeners();
    await _fetchDClone();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> _fetchDClone() async {
    try {
      _dcloneStatuses = await _service.fetchDCloneStatuses();
      _lastRefreshed = DateTime.now();
      _dcloneError = null;
    } catch (e) {
      // Surface the real error so it is visible both in the UI and adb logcat.
      _dcloneError = e.toString();
    }
  }

  Future<void> _fetchTerrorZones() async {
    _currentTerrorZones = _service.getCurrentTerrorZones();
    _recentTerrorZones = _service.getRecentTerrorZones();
  }
}
