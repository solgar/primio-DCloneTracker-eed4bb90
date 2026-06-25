import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tracker_provider.dart';
import '../theme/theme.dart';
import '../widgets/common/d2r_section_header.dart';
import '../widgets/terror/terror_zone_card.dart';

class TerrorZoneScreen extends StatelessWidget {
  const TerrorZoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TrackerProvider>();
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;

    if (provider.isLoading) {
      return Center(
        child: CircularProgressIndicator(color: d2r.gold),
      );
    }

    return RefreshIndicator(
      color: d2r.gold,
      backgroundColor: d2r.panelBg,
      onRefresh: provider.refresh,
      child: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          // Current & Next TZ
          const D2RSectionHeader(title: 'Active Terror Zones', icon: Icons.bolt),
          const SizedBox(height: AppTheme.spacingSm),
          for (final zone in provider.currentTerrorZones) ...[
            TerrorZoneCard(zone: zone),
            const SizedBox(height: AppTheme.spacingSm),
          ],
          const SizedBox(height: AppTheme.spacingMd),
          // Recent history
          const D2RSectionHeader(title: 'Recent History', icon: Icons.history),
          const SizedBox(height: AppTheme.spacingSm),
          Container(
            decoration: BoxDecoration(
              color: d2r.panelBg,
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              border: Border.all(color: d2r.panelBorder),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: provider.recentTerrorZones
                  .map((z) => TerrorZoneCard(zone: z, isCompact: true))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
