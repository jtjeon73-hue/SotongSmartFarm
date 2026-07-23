import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/navigation.dart';
import '../screens/cases_page.dart';
import '../screens/checklists_page.dart';
import '../screens/content_page.dart';
import '../screens/home_page.dart';
import '../screens/project_report_page.dart';
import '../screens/prompts_page.dart';
import '../screens/search_page.dart';
import '../screens/tools_page.dart';
import '../widgets/app_shell.dart';

final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  final contentRoutes = <RouteBase>[
    for (final item in AppNavigation.allItems)
      if (item.contentId != null)
        GoRoute(
          path: item.route,
          builder: (context, state) => ContentPage(contentId: item.contentId!),
        ),
  ];

  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomePage()),
          GoRoute(
            path: '/search',
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: '/cases',
            builder: (context, state) => const CasesPage(),
          ),
          GoRoute(
            path: '/cases/:id',
            builder: (context, state) =>
                CaseDetailPage(caseId: state.pathParameters['id']!),
          ),
          GoRoute(
            path: '/prompts',
            builder: (context, state) => const PromptsPage(),
          ),
          GoRoute(
            path: '/tools',
            builder: (context, state) => const ToolsPage(),
          ),
          GoRoute(
            path: '/checklists',
            builder: (context, state) => const ChecklistsPage(),
          ),
          GoRoute(
            path: '/project/report',
            builder: (context, state) => const ProjectReportPage(),
          ),
          ...contentRoutes,
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('페이지를 찾을 수 없습니다')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state.error?.toString() ?? '404'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => context.go('/'),
              child: const Text('홈으로'),
            ),
          ],
        ),
      ),
    ),
  );
}
