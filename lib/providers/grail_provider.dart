import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/grail_item.dart';

class GrailProvider extends ChangeNotifier {
  static const _prefsKey = 'd2r_grail_found';

  final Set<String> _foundIds = {};
  bool _loaded = false;

  bool get isLoaded => _loaded;

  bool isFound(String id) => _foundIds.contains(id);

  int get foundCount => _foundIds.length;
  int get totalCount => kTotalGrailItems;
  double get progress => totalCount == 0 ? 0 : foundCount / totalCount;

  // Per-category progress
  int foundInCategory(String categoryName) {
    final cat = kGrailCategories.firstWhere(
      (c) => c.name == categoryName,
      orElse: () => const GrailCategory(name: '', items: []),
    );
    return cat.items.where((i) => _foundIds.contains(i.id)).length;
  }

  GrailProvider() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_prefsKey) ?? [];
    _foundIds.addAll(saved);
    _loaded = true;
    notifyListeners();
  }

  Future<void> toggle(String id) async {
    if (_foundIds.contains(id)) {
      _foundIds.remove(id);
    } else {
      _foundIds.add(id);
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, _foundIds.toList());
  }

  Future<void> reset() async {
    _foundIds.clear();
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
  }
}
