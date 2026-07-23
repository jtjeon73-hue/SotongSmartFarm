import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/navigation.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/clipboard_utils.dart';
import '../data/content_catalog.dart';
import '../models/smart_farm_content.dart';
import '../widgets/content_widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  Difficulty? _difficulty;
  ContentType? _contentType;
  FarmType? _farmType;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = ContentCatalog.search(
      query: _controller.text,
      difficulty: _difficulty,
      contentType: _contentType,
      farmType: _farmType,
    );
    final menuHits = AppNavigation.allItems.where((item) {
      final q = _controller.text.trim().toLowerCase();
      if (q.isEmpty) return false;
      return item.title.toLowerCase().contains(q);
    }).toList();

    return SelectionArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '검색과 필터',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: '키워드, 기술, 메뉴명 검색',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    DropdownButton<Difficulty?>(
                      value: _difficulty,
                      hint: const Text('난이도'),
                      items: [
                        const DropdownMenuItem(value: null, child: Text('전체')),
                        ...Difficulty.values.map(
                          (d) =>
                              DropdownMenuItem(value: d, child: Text(d.label)),
                        ),
                      ],
                      onChanged: (v) => setState(() => _difficulty = v),
                    ),
                    DropdownButton<ContentType?>(
                      value: _contentType,
                      hint: const Text('콘텐츠 유형'),
                      items: [
                        const DropdownMenuItem(value: null, child: Text('전체')),
                        ...ContentType.values.map(
                          (d) =>
                              DropdownMenuItem(value: d, child: Text(d.label)),
                        ),
                      ],
                      onChanged: (v) => setState(() => _contentType = v),
                    ),
                    DropdownButton<FarmType?>(
                      value: _farmType,
                      hint: const Text('농장 유형'),
                      items: [
                        const DropdownMenuItem(value: null, child: Text('전체')),
                        ...FarmType.values.map(
                          (d) =>
                              DropdownMenuItem(value: d, child: Text(d.label)),
                        ),
                      ],
                      onChanged: (v) => setState(() => _farmType = v),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('메뉴 검색 ${menuHits.length}건'),
                const SizedBox(height: 8),
                ...menuHits.map(
                  (m) => ListTile(
                    leading: const Icon(Icons.menu_open),
                    title: _HighlightText(
                      text: m.title,
                      query: _controller.text,
                    ),
                    onTap: () => context.go(m.route),
                  ),
                ),
                const SizedBox(height: 12),
                Text('콘텐츠 검색 ${results.length}건'),
                const SizedBox(height: 8),
                ...results.map((item) {
                  final route = AppNavigation.allItems
                      .where((e) => e.contentId == item.id)
                      .map((e) => e.route)
                      .cast<String?>()
                      .firstWhere((e) => e != null, orElse: () => null);
                  return Card(
                    child: ListTile(
                      title: _HighlightText(
                        text: item.title,
                        query: _controller.text,
                      ),
                      subtitle: _HighlightText(
                        text: item.summary,
                        query: _controller.text,
                      ),
                      trailing: DifficultyBadge(difficulty: item.difficulty),
                      onTap: route == null ? null : () => context.go(route),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HighlightText extends StatelessWidget {
  const _HighlightText({required this.text, required this.query});

  final String text;
  final String query;

  @override
  Widget build(BuildContext context) {
    final parts = highlightParts(text, query);
    final q = query.trim().toLowerCase();
    return Text.rich(
      TextSpan(
        children: parts.map((part) {
          final hit = q.isNotEmpty && part.toLowerCase() == q;
          return TextSpan(
            text: part,
            style: TextStyle(
              backgroundColor: hit
                  ? AppColors.teal.withValues(alpha: 0.25)
                  : null,
              fontWeight: hit ? FontWeight.w700 : FontWeight.w400,
            ),
          );
        }).toList(),
      ),
    );
  }
}
