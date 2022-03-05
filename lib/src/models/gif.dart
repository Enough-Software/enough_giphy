import 'dart:convert';

import 'image.dart';
import 'images.dart';
import 'rating.dart';
import 'user.dart';

/// A giphy gif, sticker or emoji
class GiphyGif {
  /// Creates a new GIF instance
  const GiphyGif({
    required this.title,
    required this.type,
    required this.id,
    required this.slug,
    required this.url,
    required this.bitlyUrl,
    required this.images,
    this.embedUrl,
    this.username,
    this.source,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.createDateTime,
    this.importDateTime,
    this.trendingDateTime,
    this.user,
  });

  /// Creates a new GIF instance from [json]
  factory GiphyGif.fromJson(Map<String, dynamic> json) => GiphyGif(
        title: json['title'],
        type: json['type'],
        id: json['id'],
        slug: json['slug'],
        url: json['url'],
        bitlyUrl: json['bitly_url'] ?? json['bitly_gif_url'],
        embedUrl: json['embed_url'],
        username: json['username'],
        source: json['source'],
        rating: _toRating(json['rating']),
        contentUrl: json['content_url'],
        sourceTld: json['source_tld'],
        sourcePostUrl: json['source_post_url'],
        createDateTime: json['create_datetime'] == null
            ? null
            : DateTime.parse(json['create_datetime']),
        importDateTime: json['import_datetime'] == null
            ? null
            : DateTime.parse(json['import_datetime']),
        trendingDateTime: json['trending_datetime'] == null
            ? null
            : DateTime.parse(json['trending_datetime']),
        user: json['user'] == null ? null : GiphyUser.fromJson(json['user']),
        images: GiphyImages.fromJson(json['images']),
      );

  /// The title that appears on giphy.com for this GIF.
  final String title;

  /// The type of the gif
  ///
  /// By default, this is almost always GIF.
  final String type;

  /// The unique ID of the gif
  final String id;

  /// The unique slug used in this GIF's URL
  final String slug;

  /// The unique URL for this GIF
  final String url;

  /// The unique bit.ly URL for this GIF
  final String bitlyUrl;

  /// A URL used for embedding this GIF
  final String? embedUrl;

  /// The username this GIF is attached to, if applicable
  final String? username;

  /// The page on which this GIF was found
  final String? source;

  /// The MPAA-style rating for this content.
  /// Examples include Y, G, PG, PG-13 and R
  final GiphyRating? rating;

  /// Currently unused
  final String? contentUrl;

  /// The top level domain of the source URL.
  final String? sourceTld;

  /// The URL of the webpage on which this GIF was found.
  final String? sourcePostUrl;

  /// The date this GIF was added to the GIPHY database.
  final DateTime? createDateTime;

  /// The creation or upload date from this GIF's source.
  final DateTime? importDateTime;

  /// The date on which this gif was marked trending, if applicable.
  final DateTime? trendingDateTime;

  /// An object containing data about the user associated with this GIF,
  /// if applicable.
  final GiphyUser? user;

  /// Contains the available image data formats of this gif
  ///
  /// Compare [recommendedMobileKeyboard] for a recommendation
  /// for a GIF picker scenario.
  ///
  /// Compare [recommendedMobileSend] for a recommendation for a
  /// mobile send/share scenario.
  final GiphyImages images;

  /// Retrieves the recommended image for using this GIF
  /// in a small picker scenario
  GiphyImage get recommendedMobileKeyboard =>
      images.fixedHeightSmall ??
      images.fixedWidthSmall ??
      images.downsizedSmall ??
      images.previewWebp ??
      images.fixedWidth;

  /// Retrieves the recommended image sending / sharing this GIF
  /// in a mobile scenario
  GiphyImage get recommendedMobileSend =>
      images.downsizedLarge ?? images.original ?? images.fixedWidth;

  /// Converts this GIPHY to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'type': type,
        'id': id,
        'slug': slug,
        'url': url,
        'bitly_url': bitlyUrl,
        'embed_url': embedUrl,
        'username': username,
        'source': source,
        'rating': rating?.name,
        'content_url': contentUrl,
        'source_tld': sourceTld,
        'source_post_url': sourcePostUrl,
        'create_datetime': createDateTime?.toIso8601String(),
        'import_datetime': importDateTime?.toIso8601String(),
        'trending_datetime': trendingDateTime?.toIso8601String(),
        'user': user?.toJson(),
        'images': images.toJson()
      };

  @override
  String toString() => jsonEncode(toJson());

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
          bitlyUrl == other.bitlyUrl &&
          embedUrl == other.embedUrl &&
          username == other.username &&
          source == other.source &&
          rating == other.rating &&
          contentUrl == other.contentUrl &&
          sourceTld == other.sourceTld &&
          sourcePostUrl == other.sourcePostUrl &&
          createDateTime == other.createDateTime &&
          importDateTime == other.importDateTime &&
          trendingDateTime == other.trendingDateTime &&
          user == other.user &&
          images == other.images;

  @override
  int get hashCode =>
      title.hashCode ^
      type.hashCode ^
      id.hashCode ^
      slug.hashCode ^
      url.hashCode ^
      bitlyUrl.hashCode ^
      embedUrl.hashCode ^
      username.hashCode ^
      source.hashCode ^
      rating.hashCode ^
      contentUrl.hashCode ^
      sourceTld.hashCode ^
      sourcePostUrl.hashCode ^
      createDateTime.hashCode ^
      importDateTime.hashCode ^
      trendingDateTime.hashCode ^
      user.hashCode ^
      images.hashCode;

  static GiphyRating? _toRating(String? value) {
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
