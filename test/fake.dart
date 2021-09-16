import 'dart:convert';

import 'package:enough_giphy/enough_giphy.dart';
import 'package:flutter_test/flutter_test.dart';
import 'data/data.dart';

class FakeGiphyClient extends Fake implements GiphyClient {
  @override
  Future<GiphySource> trending({
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
    GiphyType type = GiphyType.gifs,
  }) async {
    final request = GiphyRequest(type, lang, rating);
    final initialPage = await trendingCollection();
    return GiphySource(this, request, initialPage);
  }

  @override
  Future<GiphyCollection> trendingCollection({
    int offset = 0,
    int limit = 30,
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
    GiphyType type = GiphyType.gifs,
  }) {
    final body = trendingBody;

    final decoded =
        GiphyCollection.fromJson(json.decode(body) as Map<String, dynamic>);
    return Future.value(decoded);
  }

  @override
  Future<GiphyCollection> searchCollection(
    String query, {
    int offset = 0,
    int limit = 30,
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
    GiphyType type = GiphyType.gifs,
  }) {
    final body = searchBody;

    final decoded =
        GiphyCollection.fromJson(json.decode(body) as Map<String, dynamic>);
    return Future.value(decoded);
  }

  @override
  Future<GiphyCollection> emojisCollection({
    int offset = 0,
    int limit = 30,
    GiphyRating rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
  }) {
    final body = emojiBody;

    final decoded =
        GiphyCollection.fromJson(json.decode(body) as Map<String, dynamic>);
    return Future.value(decoded);
  }

  @override
  Future<GiphyGif> random({
    required String tag,
    GiphyRating rating = GiphyRating.g,
    GiphyType type = GiphyType.gifs,
  }) async =>
      GiphyGif.fromJson((json.decode(randomBody)
          as Map<String, dynamic>)['data'] as Map<String, dynamic>);

  @override
  Future<GiphyGif> byId(String id) async =>
      GiphyGif.fromJson((json.decode(byIdBody) as Map<String, dynamic>)['data']
          as Map<String, dynamic>);

  @override
  Future<String> getRandomId() async => throw UnimplementedError();
}
