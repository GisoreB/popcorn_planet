import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getGenreNames(
  List<int>? genreIds,
  List<dynamic>? genresList,
) {
  if (genreIds == null || genresList == null) return '';
  List<String> names = [];

  for (var id in genreIds) {
    final match = genresList.firstWhere(
      (g) => g['id'] == id,
      orElse: () => null,
    );
    if (match != null) {
      names.add(match['name']);
    }
  }

  // Limit to 3 genres for UI
  return names.take(3).join(' • ');
}
