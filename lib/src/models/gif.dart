import 'image.dart';
import 'images.dart';
import 'rating.dart';
import 'user.dart';

class GiphyGif {
  String title;
  String type;
  String id;
  String slug;
  String url;
  String? bitlyGifUrl;
  String bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  GiphyRating? rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  // int? isSticker;
  DateTime? importDatetime;
  DateTime? trendingDatetime;
  GiphyUser? user;

  /// Contains the available image data formats of this gif
  ///
  /// Compare [recommendedMobileKeyboard] for a recommendation for a GIF picker scenario
  /// Compare [recommendedMobileSend] for a recommendation for a mobile send/share scenario
  GiphyImages images;

  /// Retrieves the recommended image for using this GIF in a small picker scenario
  GiphyImage get recommendedMobileKeyboard =>
      images.fixedHeightSmall ??
      images.fixedWidthSmall ??
      images.downsizedSmall ??
      images.previewWebp ??
      images.fixedWidth;

  /// Retrieves the recommended image sending / sharing this GIF in a mobile scenario
  GiphyImage get recommendedMobileSend =>
      images.downsizedLarge ?? images.original ?? images.fixedWidth;

  GiphyGif({
    required this.title,
    required this.type,
    required this.id,
    required this.slug,
    required this.url,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    // required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.user,
    required this.images,
  });

  factory GiphyGif.fromJson(Map<String, dynamic> json) => GiphyGif(
      title: json['title'],
      type: json['type'],
      id: json['id'],
      slug: json['slug'],
      url: json['url'],
      bitlyGifUrl: json['bitly_gif_url'],
      bitlyUrl: json['bitly_url'],
      embedUrl: json['embed_url'],
      username: json['username'],
      source: json['source'],
      rating: _toRating(json['rating']),
      contentUrl: json['content_url'],
      sourceTld: json['source_tld'],
      sourcePostUrl: json['source_post_url'],
      // isSticker: json['is_sticker'] as int,
      importDatetime: DateTime.parse(json['import_datetime']),
      trendingDatetime: DateTime.parse(json['trending_datetime']),
      user: GiphyUser.fromJson(json['user'] as Map<String, dynamic>?),
      images: GiphyImages.fromJson(json['images'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'type': type,
      'id': id,
      'slug': slug,
      'url': url,
      'bitly_gif_url': bitlyGifUrl,
      'bitly_url': bitlyUrl,
      'embed_url': embedUrl,
      'username': username,
      'source': source,
      'rating': rating?.name,
      'content_url': contentUrl,
      'source_tld': sourceTld,
      'source_post_url': sourcePostUrl,
      // 'is_sticker': isSticker,
      'import_datetime': importDatetime?.toIso8601String(),
      'trending_datetime': trendingDatetime?.toIso8601String(),
      'user': user?.toJson(),
      'images': images.toJson()
    };
  }

  @override
  String toString() {
    return 'GiphyGif{title: $title, type: $type, id: $id, slug: $slug, url: $url, bitlyGifUrl: $bitlyGifUrl, bitlyUrl: $bitlyUrl, embedUrl: $embedUrl, username: $username, source: $source, rating: $rating, contentUrl: $contentUrl, sourceTld: $sourceTld, sourcePostUrl: $sourcePostUrl,  importDatetime: $importDatetime, trendingDatetime: $trendingDatetime, user: $user, images: $images}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyGif &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          type == other.type &&
          id == other.id &&
          slug == other.slug &&
          url == other.url &&
          bitlyGifUrl == other.bitlyGifUrl &&
          bitlyUrl == other.bitlyUrl &&
          embedUrl == other.embedUrl &&
          username == other.username &&
          source == other.source &&
          rating == other.rating &&
          contentUrl == other.contentUrl &&
          sourceTld == other.sourceTld &&
          sourcePostUrl == other.sourcePostUrl &&
          // isSticker == other.isSticker &&
          importDatetime == other.importDatetime &&
          trendingDatetime == other.trendingDatetime &&
          user == other.user &&
          images == other.images;

  @override
  int get hashCode =>
      title.hashCode ^
      type.hashCode ^
      id.hashCode ^
      slug.hashCode ^
      url.hashCode ^
      bitlyGifUrl.hashCode ^
      bitlyUrl.hashCode ^
      embedUrl.hashCode ^
      username.hashCode ^
      source.hashCode ^
      rating.hashCode ^
      contentUrl.hashCode ^
      sourceTld.hashCode ^
      sourcePostUrl.hashCode ^
      // isSticker.hashCode ^
      importDatetime.hashCode ^
      trendingDatetime.hashCode ^
      user.hashCode ^
      images.hashCode;

  static GiphyRating? _toRating(dynamic value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'g':
        return GiphyRating.g;
      case 'pg':
        return GiphyRating.pg;
      case 'pg13':
        return GiphyRating.pg13;
      case 'r':
        return GiphyRating.r;
    }
    return null;
  }
}
