import 'dart:convert';

/// Contains information about a GIPHY contributor
class GiphyUser {
  /// Creates a new user
  GiphyUser({
    this.avatarUrl,
    this.bannerUrl,
    this.profileUrl,
    this.username,
    this.displayName,
    this.guid,
    this.metadataDescription,
    this.attributionDisplayName,
    this.name,
    this.description,
    this.facebookUrl,
    this.twitter,
    this.twitterUrl,
    this.instagramUrl,
    this.tumblrUrl,
    this.suppressChrome,
    this.websiteUrl,
    this.websiteDisplayUrl,
  });

  /// Creates a new user from [json]
  factory GiphyUser.fromJson(Map<String, dynamic> json) => GiphyUser(
        avatarUrl: json['avatar_url'],
        bannerUrl: json['banner_url'],
        profileUrl: json['profile_url'],
        username: json['username'],
        displayName: json['display_name'],
        guid: json['guid'],
        metadataDescription: json['metadata_description'],
        attributionDisplayName: json['attribution_display_name'],
        name: json['name'],
        description: json['description'],
        facebookUrl: json['facebook_url'],
        twitter: json['twitter'],
        twitterUrl: json['twitter_url'],
        instagramUrl: json['instagram_url'],
        tumblrUrl: json['tumblr_url'],
        suppressChrome: json['suppress_chrome'],
        websiteUrl: json['website_url'],
        websiteDisplayUrl: json['website_display_url'],
      );

  /// The URL for this user's avatar image.
  final String? avatarUrl;

  /// The URL for the banner image that appears atop this user's profile page.
  final String? bannerUrl;

  /// The URL for this user's GIPHY profile.
  final String? profileUrl;

  /// The username associated with this user.
  final String? username;

  /// The display name associated with this user
  /// (contains formatting the base username might not).
  final String? displayName;

  /// global unique ID of the user
  final String? guid;

  /// meta data description
  final String? metadataDescription;

  /// Name to be shown for attribution
  final String? attributionDisplayName;

  /// The name of the user
  final String? name;

  /// The description
  final String? description;

  /// Facebook URL of the user
  final String? facebookUrl;

  /// Twitter name of the user
  final String? twitter;

  /// Twitter URL of the user
  final String? twitterUrl;

  /// Instagram URL of the user
  final String? instagramUrl;

  /// Tumblr URL of the user
  final String? tumblrUrl;

  /// Should UI chrome be suppressed
  final bool? suppressChrome;

  /// Website URL of the user
  final String? websiteUrl;

  /// Website name
  final String? websiteDisplayUrl;

  /// Concerts this user to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'avatar_url': avatarUrl,
        'banner_url': bannerUrl,
        'profile_url': profileUrl,
        'username': username,
        'display_name': displayName,
        'guid': guid,
        'metadata_description': metadataDescription,
        'attribution_display_name': attributionDisplayName,
        'name': name,
        'description': description,
        'facebook_url': facebookUrl,
        'twitter': twitter,
        'twitter_url': twitterUrl,
        'instagram_url': instagramUrl,
        'tumblr_url': tumblrUrl,
        'suppress_chrome': suppressChrome,
        'website_url': websiteUrl,
        'website_display_url': websiteDisplayUrl,
      };

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyUser &&
          runtimeType == other.runtimeType &&
          avatarUrl == other.avatarUrl &&
          bannerUrl == other.bannerUrl &&
          profileUrl == other.profileUrl &&
          username == other.username &&
          displayName == other.displayName &&
          guid == other.guid &&
          metadataDescription == other.metadataDescription &&
          attributionDisplayName == other.attributionDisplayName &&
          name == other.name &&
          description == other.description &&
          facebookUrl == other.facebookUrl &&
          twitter == other.twitter &&
          twitterUrl == other.twitterUrl &&
          instagramUrl == other.instagramUrl &&
          tumblrUrl == other.tumblrUrl &&
          suppressChrome == other.suppressChrome &&
          websiteUrl == other.websiteUrl &&
          websiteDisplayUrl == other.websiteDisplayUrl;

  @override
  int get hashCode =>
      (avatarUrl?.hashCode ?? 0) ^
      (bannerUrl?.hashCode ?? 0) ^
      (profileUrl?.hashCode ?? 0) ^
      (username?.hashCode ?? 0) ^
      (displayName?.hashCode ?? 0) ^
      (guid?.hashCode ?? 0) ^
      (metadataDescription?.hashCode ?? 0) ^
      (attributionDisplayName?.hashCode ?? 0) ^
      (name?.hashCode ?? 0) ^
      (description?.hashCode ?? 0) ^
      (facebookUrl?.hashCode ?? 0) ^
      (twitter?.hashCode ?? 0) ^
      (twitterUrl?.hashCode ?? 0) ^
      (instagramUrl?.hashCode ?? 0) ^
      (tumblrUrl?.hashCode ?? 0) ^
      (suppressChrome?.hashCode ?? 0) ^
      (websiteUrl?.hashCode ?? 0) ^
      (websiteDisplayUrl?.hashCode ?? 0);
}
