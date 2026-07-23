import 'package:flutter/material.dart';

IconData navIcon(String name) {
  switch (name) {
    case 'school':
      return Icons.school_outlined;
    case 'eco':
      return Icons.eco_outlined;
    case 'sensors':
      return Icons.sensors;
    case 'memory':
      return Icons.memory;
    case 'developer_board':
      return Icons.developer_board;
    case 'lan':
      return Icons.lan_outlined;
    case 'code':
      return Icons.code;
    case 'psychology':
      return Icons.psychology_outlined;
    case 'engineering':
      return Icons.engineering_outlined;
    case 'security':
      return Icons.security;
    case 'folder_special':
      return Icons.folder_special_outlined;
    case 'menu_book':
      return Icons.menu_book_outlined;
    case 'info':
      return Icons.info_outline;
    default:
      return Icons.article_outlined;
  }
}
