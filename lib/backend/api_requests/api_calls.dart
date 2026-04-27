import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TrendingCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '2dde41a66e76ff7ca4cba9039fb345e4',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Trending',
      apiUrl: 'https://api.themoviedb.org/3/trending/movie/week',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? movieResults(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<int>? movieId(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? movieTitle(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? movieOverview(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].overview''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? movieImage(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].poster_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? movieOriginalTitle(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].original_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? movieGenreIds(dynamic response) => getJsonField(
        response,
        r'''$.results[:].genre_ids''',
        true,
      ) as List?;
  static List<double>? movieVoteAverage(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].vote_average''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class GenreCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '2dde41a66e76ff7ca4cba9039fb345e4',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Genre',
      apiUrl: 'https://api.themoviedb.org/3/genre/movie/list?language=en',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_key': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? genres(dynamic response) => getJsonField(
        response,
        r'''$.genres''',
        true,
      ) as List?;
  static List<int>? genresId(dynamic response) => (getJsonField(
        response,
        r'''$.genres[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? genresName(dynamic response) => (getJsonField(
        response,
        r'''$.genres[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
