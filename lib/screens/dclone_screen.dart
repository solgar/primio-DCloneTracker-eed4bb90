import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/tracker_provider.dart';
import '../theme/theme.dart';
import '../widgets/common/d2r_section_header.dart';
import '../widgets/dclone/dclone_card.dart';
import '../widgets/dclone/dclone_filter_bar.dart';

class DCloneScreen extends StatelessWidget {
  const DCloneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TrackerProvider>();
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;

    if (provider.isLoading) {
      return Center(
        child: CircularProgressIndicator(color: d2r.gold),
      );
    }

    // Full-screen error when we have no data at all.
    if (provider.dcloneError != null && provider.dcloneStatuses.isEmpty) {
      return _DCloneErrorView(
        message: provider.dcloneError!,
        onRetry: provider.retryDClone,
      );
    }

    final statuses = provider.filteredStatuses;
    final regions = <String>[];
    for (final s in statuses) {
      if (!regions.contains(s.region)) regions.add(s.region);
    }

    return RefreshIndicator(
      color: d2r.gold,
      backgroundColor: d2r.panelBg,
      onRefresh: provider.refresh,
      child: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          // ── Header panel ──────────────────────────────────────────────────
          _DCloneHeaderPanel(provider: provider),
          const SizedBox(height: AppTheme.spacingMd),

          // ── Inline error banner (stale data + network issue) ──────────────
          if (provider.dcloneError != null) ...[
            _DCloneErrorBanner(
              message: provider.dcloneError!,
              onRetry: provider.retryDClone,
            ),
            const SizedBox(height: AppTheme.spacingMd),
          ],

          // ── Filter & sort bar ──────────────────────────────────────────────
          DCloneFilterBar(
            selectedRegion: provider.selectedRegion,
            selectedHc: provider.selectedHc,
            selectedLadder: provider.selectedLadder,
            sortOrder: provider.sortOrder,
            onRegionChanged: provider.setRegion,
            onHcChanged: provider.setHc,
            onLadderChanged: provider.setLadder,
            onSortChanged: provider.setSortOrder,
          ),
          const SizedBox(height: AppTheme.spacingMd),

          // ── Cards grouped by region ────────────────────────────────────────
          for (final region in regions) ...[
            D2RSectionHeader(title: region, icon: Icons.public),
            const SizedBox(height: AppTheme.spacingSm),
            ...statuses
                .where((s) => s.region == region)
                .map((s) => Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppTheme.spacingSm),
                      child: DCloneCard(status: s),
                    )),
            const SizedBox(height: AppTheme.spacingSm),
          ],
        ],
      ),
    );
  }
}

// ── Header panel with title, description and last-refreshed / LIVE badge ────

class _DCloneHeaderPanel extends StatelessWidget {
  const _DCloneHeaderPanel({required this.provider});

  final TrackerProvider provider;

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    final refreshed = provider.lastRefreshed;
    final timeLabel = refreshed != null
        ? 'Updated ${DateFormat('HH:mm:ss').format(refreshed)}'
        : 'Fetching live data…';

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: d2r.panelBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(color: d2r.panelBorder),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DIABLO CLONE TRACKER',
                style: text.titleMedium?.copyWith(
                  color: d2r.demonRed,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(width: AppTheme.spacingSm),
              // LIVE badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: d2r.poison.withValues(alpha: AppTheme.opacityHint),
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusSmall),
                  border: Border.all(
                    color: d2r.poison,
                    width: AppTheme.borderDefault,
                  ),
                ),
                child: Text(
                  'LIVE',
                  style: text.labelSmall?.copyWith(
                    color: d2r.poison,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'Track Stone of Jordan sales progress across all servers. '
            'When progress reaches 6/6, Uber Diablo walks the earth!',
            style: text.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingXs),
          Text(
            timeLabel,
            style: text.labelSmall,
            textAlign: TextAlign.center,
          ),
          Text(
            'Source: diablo2.io community API',
            style: text.labelSmall?.copyWith(
              color: d2r.subtleText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ── Inline error banner shown when stale data is present ────────────────────

class _DCloneErrorBanner extends StatelessWidget {
  const _DCloneErrorBanner({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: d2r.demonRed.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(
          color: d2r.demonRed.withValues(alpha: AppTheme.opacityHint),
          width: AppTheme.borderDefault,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.wifi_off_rounded, color: d2r.demonRed, size: AppTheme.iconMd),
          const SizedBox(width: AppTheme.spacingSm),
          Expanded(
            child: Text(
              message,
              style: text.bodySmall?.copyWith(color: d2r.demonRed),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: text.labelSmall?.copyWith(color: d2r.gold),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Full-screen error view shown when no cached data is available ────────────

class _DCloneErrorView extends StatelessWidget {
  const _DCloneErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off_rounded,
                color: d2r.demonRed, size: AppTheme.iconXl),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'Failed to Reach Sanctuary',
              style: text.titleMedium?.copyWith(color: d2r.demonRed),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingSm),
            Text(
              message,
              style: text.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingLg),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, color: d2r.gold),
              label: Text(
                'Try Again',
                style: text.labelMedium?.copyWith(color: d2r.gold),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: d2r.gold, width: AppTheme.borderDefault),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
