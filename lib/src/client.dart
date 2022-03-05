import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/models.dart';

/// A client for GIPHY
///
/// Sign up for the mandatory API key for each supported platform
/// at developers.giphy.com,
/// compare https://developers.giphy.com/docs/api#quick-start-guide for details.
class GiphyClient {
  /// Creates a new client with the given [apiKey].
  ///
  /// Optionally specify a [randomId] to personalize the experience
  /// of the current user.
  ///
  /// Compare [getRandomId] for an option to generate a random ID.
  GiphyClient({required String apiKey, String? randomId})
      : _apiKey = apiKey,
        _randomId = randomId;

  static const _defaultLimit = 30;
  static const String _apiVersion = 'v1';
  static final _baseUri = Uri(scheme: 'https', host: 'api.giphy.com');

  final _client = http.Client();
  final String _apiKey;
  String? _randomId;

  /// Retrieve the trending GIFs or Stickers.
  ///
  /// Optionally specify the two-letter language code in [lang] to
  /// localize the experience.
  ///
  /// You can change the [rating] which defaults to [GiphyRating.g]
  /// meaning all-ages content.
  ///
  /// Set the [type]  to [GiphyType.gifs] (default) or [GiphyType.stickers].
  Future<GiphySource> trending({
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
    GiphyType type = GiphyType.gifs,
  }) =>
      request(GiphyRequest(type, lang, rating));

  /// Retrieves a single collection page of the trending GIFs or Stickers.
  ///
  /// Set the [offset] from which the page should be retrieved (default to `0`).
  ///
  /// Set the page size with [limit] (defaults to `30`).
  ///
  /// Compare [trending] for optional settings.
  Future<GiphyCollection> trendingCollection({
    int offset = 0,
    int limit = _defaultLimit,
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
    GiphyType type = GiphyType.gifs,
  }) =>
      _fetchCollection(
        _baseUri.replace(
          path: '$_apiVersion/${type.name}/trending',
          queryParameters: <String, String>{
            'offset': '$offset',
            'limit': '$limit',
            'rating': rating.name,
            'lang': lang
          },
        ),
      );

  /// Searches for GIFs or Stickers with the given search [query].
  ///
  /// Search for a user by adding `@` at the beginning of the [query],
  /// e.g. `@user`.
  ///
  /// Optionally specify the two-letter language code in [lang] to localize
  /// the experience.
  ///
  /// You can change the [rating] which defaults to [GiphyRating.g] meaning
  /// all-ages content.
  ///
  /// Set the [type]  to [GiphyType.gifs] (default) or [GiphyType.stickers].
  Future<GiphySource> search(
    String query, {
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
    GiphyType type = GiphyType.gifs,
  }) =>
      request(GiphyRequest(type, lang, rating, searchQuery: query));

  /// Retrieves a single collection page of the give search [query].
  ///
  /// Set the [offset] from which the page should be retrieved (default to `0`).
  ///
  /// Set the page size with [limit] (defaults to `30`).
  ///
  /// Compare [search] for optional settings.
  Future<GiphyCollection> searchCollection(
    String query, {
    int offset = 0,
    int limit = _defaultLimit,
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
    GiphyType type = GiphyType.gifs,
  }) =>
      _fetchCollection(
        _baseUri.replace(
          path: '$_apiVersion/${type.name}/search',
          queryParameters: <String, String>{
            'q': query,
            'offset': '$offset',
            'limit': '$limit',
            'rating': rating.name,
            'lang': lang,
          },
        ),
      );

  /// Retrieves the emojis of GIPHY
  ///
  /// Optionally specify the two-letter language code in [lang] to localize
  /// the experience.
  ///
  /// You can change the [rating] which defaults to [GiphyRating.g] meaning
  /// all-ages content.
  Future<GiphySource> emojis({
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
  }) =>
      request(GiphyRequest(GiphyType.emoji, lang, rating));

  /// Retrieves a single collection page of the emojis.
  ///
  /// Set the [offset] from which the page should be retrieved (default to `0`).
  ///
  /// Set the page size with [limit] (defaults to `30`).
  ///
  /// Compare [emojis] for optional settings.
  Future<GiphyCollection> emojisCollection({
    int offset = 0,
    int limit = _defaultLimit,
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
  }) =>
      _fetchCollection(
        _baseUri.replace(
          path: '$_apiVersion/${GiphyType.emoji.name}',
          queryParameters: <String, String>{
            'offset': '$offset',
            'limit': '$limit',
            'rating': rating.name,
            'lang': lang,
          },
        ),
      );

  /// Gets a random GIF that matches the given [tag]
  ///
  /// You can change the [rating] which defaults to [GiphyRating.g] meaning
  /// all-ages content.
  ///
  /// Set the [type]  to [GiphyType.gifs] (default) or [GiphyType.stickers].
  Future<GiphyGif> random({
    required String tag,
    GiphyRating rating = GiphyRating.g,
    GiphyType type = GiphyType.gifs,
  }) =>
      _fetchGif(
        _baseUri.replace(
          path: '$_apiVersion/${type.name}/random',
          queryParameters: <String, String>{
            'tag': tag,
            'rating': rating.name,
          },
        ),
      );

  /// Retrieves the GIF with the given [id].
  Future<GiphyGif> byId(String id) =>
      _fetchGif(_baseUri.replace(path: '$_apiVersion/gifs/$id'));

  /// Retrieves a random ID
  /// that can be used to personalize the experience for the associated user
  Future<String> getRandomId() =>
      _getRandomId(_baseUri.replace(path: '$_apiVersion/randomid'));

  /// Retrieves the trending search terms (English only)
  Future<List<String>> trendingSearchTerms() async {
    final uri = _baseUri.replace(path: '$_apiVersion/trending/searches');
    final response = await _getWithAuthorization(uri);
    final Map<String, dynamic> result = json.decode(response.body);
    final List<dynamic> data = result['data'];
    return data.map((d) => d.toString()).toList();
  }

  /// Requests a [GiphySource] from the given [request].
  Future<GiphySource> request(GiphyRequest request) async {
    final initialPage = await _requestCollection(request: request);
    return GiphySource(this, request, initialPage);
  }

  /// Closes the client and cleans up any resources associated with it.
  ///
  /// It's important to close each client when it's done being used;
  /// failing to do so can cause the Dart process to hang.
  void close() {
    _client.close();
  }

  Future<GiphyCollection> _requestCollection({
    required GiphyRequest request,
    int offset = 0,
    int limit = _defaultLimit,
  }) {
    final query = request.searchQuery;
    final type = request.type;
    if (query != null && type != GiphyType.emoji) {
      return searchCollection(
        query,
        offset: offset,
        limit: limit,
        rating: request.rating,
        lang: request.language,
        type: request.type,
      );
    }
    switch (type) {
      case GiphyType.gifs:
      case GiphyType.stickers:
        return trendingCollection(
          offset: offset,
          limit: limit,
          rating: request.rating,
          lang: request.language,
          type: request.type,
        );
      case GiphyType.emoji:
        return emojisCollection(
          offset: offset,
          limit: limit,
          rating: request.rating,
          lang: request.language,
        );
    }
  }

  Future<GiphyGif> _fetchGif(Uri uri) async {
    final response = await _getWithAuthorization(uri);

    return GiphyGif.fromJson((json.decode(response.body)
        as Map<String, dynamic>)['data'] as Map<String, dynamic>);
  }

  Future<GiphyCollection> _fetchCollection(Uri uri) async {
    final response = await _getWithAuthorization(uri);

    return GiphyCollection.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  }

  Future<String> _getRandomId(Uri uri) async {
    final response = await _getWithAuthorization(uri);
    final decoded = json.decode(response.body);
    final randomId = decoded['data']['random_id'];
    _randomId = randomId;
    return randomId;
  }

  Future<http.Response> _getWithAuthorization(Uri uri) async {
    final queryParams = Map<String, String>.from(uri.queryParameters)
      ..putIfAbsent('api_key', () => _apiKey);
    final randomId = _randomId;
    if (randomId != null) {
      queryParams.putIfAbsent('random_id', () => randomId);
    }
    final usedUri = uri.replace(queryParameters: queryParams);
    // print('giphy: requesting $usedUri');
    final response = await _client.get(usedUri);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw GiphyClientError(response.statusCode, response.body);
    }
  }
}

/// Encapsulates a request to ease subsequent requests
class GiphyRequest {
  /// Creates a new request
  ///
  /// Compare [GiphyRequest.trending], [GiphyRequest.emojis],
  /// [GiphyRequest.search]
  const GiphyRequest(this.type, this.language, this.rating, {this.searchQuery});

  /// Convenience method to create a trending request
  factory GiphyRequest.trending({
    GiphyType type = GiphyType.gifs,
    String language = GiphyLanguage.english,
    GiphyRating rating = GiphyRating.g,
  }) =>
      GiphyRequest(type, language, rating);

  /// Convenience method to create an emoji request
  factory GiphyRequest.emojis({
    String language = GiphyLanguage.english,
    GiphyRating rating = GiphyRating.g,
  }) =>
      GiphyRequest(GiphyType.emoji, language, rating);

  /// Convenience method to create a search request
  factory GiphyRequest.search({
    required String query,
    GiphyType type = GiphyType.gifs,
    String language = GiphyLanguage.english,
    GiphyRating rating = GiphyRating.g,
  }) =>
      GiphyRequest(type, language, rating,
          searchQuery: query.isEmpty ? null : query);

  /// The type of the request
  final GiphyType type;

  /// The language code
  final String language;

  /// The rating
  final GiphyRating rating;

  /// The search query
  final String? searchQuery;

  /// Copies this request with only the specified setting changed.
  GiphyRequest copyWith({
    GiphyType? type,
    String? language,
    GiphyRating? rating,
    String? searchQuery,
  }) =>
      GiphyRequest(
        type ?? this.type,
        language ?? this.language,
        rating ?? this.rating,
        searchQuery: searchQuery ?? this.searchQuery,
      );

  /// Copies this request with only the specified settings changed
  /// but without search query.
  GiphyRequest copyWithoutSearchQuery({
    GiphyType? type,
    String? language,
    GiphyRating? rating,
  }) =>
      GiphyRequest(
        type ?? this.type,
        language ?? this.language,
        rating ?? this.rating,
        searchQuery: null,
      );
}

/// A source to download all messages in paged requests
class GiphySource {
  /// Creates a new source
  GiphySource(
    GiphyClient client,
    GiphyRequest request,
    GiphyCollection initialPage,
  )   : _client = client,
        _request = request,
        totalCount = initialPage.pagination?.totalCount,
        _pageLength = initialPage.pagination?.count ?? initialPage.data.length,
        nextCursor = initialPage.pagination?.nextCursor {
    final images = initialPage.data;
    for (var i = 0; i < images.length; i++) {
      _cache[i] = images[i];
    }
  }

  /// Provides the total length of matching elements
  final int? totalCount;

  /// the next cursor
  int? nextCursor;

  /// Retrieves the type in this source
  GiphyType get type => _request.type;

  /// Retrieves the language
  String get language => _request.language;

  /// Retrieves the already loaded matching elements
  int get cacheCount => _cache.length;

  /// Checks if this source contains at least 1 element
  bool get isNotEmpty => !isEmpty;

  /// Checks if this source is empty
  bool get isEmpty => _cache.isEmpty;

  final GiphyClient _client;
  final GiphyRequest _request;
  final int _pageLength;
  final _cache = <int, GiphyGif>{};
  final _requestedPages = <int, Future<GiphyCollection>>{};

  /// Loads the element with the given [index]
  Future<GiphyGif> load(int index) async {
    final existing = _cache[index];
    if (existing != null) {
      return existing;
    }
    if (!hasElementAt(index)) {
      final total = nextCursor != null ? nextCursor : totalCount;
      throw IndexError(index, null, null,
          'Invalid index $index in source with total $total', total);
    }
    final page = index ~/ _pageLength;
    var pageRequest = _requestedPages[page];
    if (pageRequest == null) {
      pageRequest = _loadPage(page);
      _requestedPages[page] = pageRequest;
    }
    await pageRequest;
    final loaded = _cache[index];
    if (loaded == null) {
      throw GiphyClientError(400, 'Unable to load item $index in source');
    }
    return loaded;
  }

  /// Retrieves the gif with the given [index] from the cache,
  /// if already present
  GiphyGif? operator [](int index) => _cache[index];

  Future<GiphyCollection> _loadPage(int page) async {
    final offset = page * _pageLength;
    // print('load page $page with offset $offset for ${_request.type}');
    final collection = await _client._requestCollection(
      request: _request,
      offset: offset,
      limit: _pageLength,
    );
    final images = collection.data;
    for (var i = 0; i < images.length; i++) {
      _cache[i + offset] = images[i];
    }
    return collection;
  }

  /// Does this source contain an element at the given position?
  bool hasElementAt(int index) {
    if (index < 0) {
      return false;
    }
    final totalCount = this.totalCount;
    if (totalCount != null) {
      return index < totalCount;
    }
    final nextCursor = this.nextCursor;
    if (nextCursor != null) {
      return index < nextCursor + _pageLength;
    }
    return false;
  }
}

/// Provides error details
class GiphyClientError implements Exception {
  /// Creates a new exception
  GiphyClientError(this.statusCode, this.exception);

  /// The HTTP status code
  final int statusCode;

  /// Any exception details
  final String exception;

  @override
  String toString() =>
      'GiphyClientError{statusCode: $statusCode, exception: $exception}';
}
