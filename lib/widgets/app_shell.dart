import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/navigation.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/nav_icons.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Set<String> _expanded = {for (final g in AppNavigation.groups) g.id};

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= AppConstants.desktopBreakpoint;
    final location = GoRouterState.of(context).uri.path;

    final drawer = _NavPanel(
      location: location,
      expanded: _expanded,
      onToggle: (id) {
        setState(() {
          if (_expanded.contains(id)) {
            _expanded.remove(id);
          } else {
            _expanded.add(id);
          }
        });
      },
      onSelect: (route) {
        context.go(route);
        if (!isDesktop && _scaffoldKey.currentState?.isDrawerOpen == true) {
          Navigator.of(context).pop();
        }
      },
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          isDesktop
              ? '${AppConstants.appName} · ${AppConstants.appTagline}'
              : AppConstants.appName,
          overflow: TextOverflow.ellipsis,
        ),
        leading: isDesktop
            ? null
            : IconButton(
                tooltip: '메뉴 열기',
                icon: const Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
        actions: [
          IconButton(
            tooltip: '검색',
            icon: const Icon(Icons.search),
            onPressed: () => context.go('/search'),
          ),
        ],
      ),
      drawer: isDesktop ? null : Drawer(child: SafeArea(child: drawer)),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isDesktop)
            SizedBox(
              width: 300,
              child: Material(color: Colors.white, elevation: 0, child: drawer),
            ),
          if (isDesktop)
            Container(width: 1, color: Colors.black.withValues(alpha: 0.08)),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

class _NavPanel extends StatelessWidget {
  const _NavPanel({
    required this.location,
    required this.expanded,
    required this.onToggle,
    required this.onSelect,
  });

  final String location;
  final Set<String> expanded;
  final ValueChanged<String> onToggle;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.deepNavy, AppColors.farmGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.appName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '센서 · 제어 · 통신 · AI · 운영을 체계적으로 학습',
                style: TextStyle(color: Colors.white70, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...AppNavigation.groups.map((group) {
          final isOpen = expanded.contains(group.id);
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: Icon(navIcon(group.iconName), color: AppColors.teal),
                title: Text(
                  group.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Icon(isOpen ? Icons.expand_less : Icons.expand_more),
                onTap: () => onToggle(group.id),
                minVerticalPadding: 12,
              ),
              if (isOpen)
                ...group.items.map((item) {
                  final selected =
                      location == item.route ||
                      location.startsWith('${item.route}/');
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ListTile(
                      selected: selected,
                      selectedTileColor: AppColors.farmGreen.withValues(
                        alpha: 0.1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      title: Text(item.title),
                      onTap: () => onSelect(item.route),
                      minVerticalPadding: 10,
                    ),
                  );
                }),
            ],
          );
        }),
      ],
    );
  }
}
