import 'dart:convert';

/// Base class for images
class GiphyImage {
  /// Creates a new image
  const GiphyImage(this.url, this.width, this.height, this.size);

  /// The download URL of this image data
  final String url;

  /// The width of this image in pixels, e.g. `"200"`
  final String width;

  /// The width of this image in pixels, e.g. `200`
  int get widthInt => int.parse(width);

  /// The width of this image in pixels, e.g. `200.0`
  double get widthDouble => double.parse(width);

  /// The height of this image in pixels, e.g. `"300"`
  final String height;

  /// The height of this image in pixels, e.g. `300`
  int get heightInt => int.parse(height);

  /// The height of this image in pixels, e.g. `300.0`
  double get heightDouble => double.parse(height);

  /// The size of this image data in bytes, e.g. `"62923"`
  final String size;

  /// The size of this image data in bytes, e.g. `62923`
  int get sizeInt => int.parse(size);

  /// Converts this image to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'width': width,
        'height': height,
        'size': size,
      };

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size;

  @override
  int get hashCode =>
      url.hashCode ^ width.hashCode ^ height.hashCode ^ size.hashCode;
}

/// A full image description
class GiphyFullImage extends GiphyImage {
  /// Creates a new full image
  const GiphyFullImage({
    required String url,
    required String width,
    required String height,
    required String size,
    this.mp4,
    this.mp4Size,
    this.webp,
    this.webpSize,
  }) : super(url, width, height, size);

  /// Creates a new full image from [json]
  factory GiphyFullImage.fromJson(Map<String, dynamic> json) => GiphyFullImage(
        url: json['url'],
        width: json['width'],
        height: json['height'],
        size: json['size'],
        mp4: json['mp4'],
        mp4Size: json['mp4_size'],
        webp: json['webp'],
        webpSize: json['webp_size'],
      );

  /// Optional URL of the MP4 data
  final String? mp4;

  /// Optional size of the MP4 data in bytes
  final String? mp4Size;

  /// Optional URL of the WEBP data
  final String? webp;

  /// Optional size of the WEBP data in bytes
  final String? webpSize;

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..['mp4'] = mp4
    ..['mp4_size'] = mp4Size
    ..['webp'] = webp
    ..['webp_size'] = webpSize;

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyFullImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size &&
          mp4 == other.mp4 &&
          mp4Size == other.mp4Size &&
          webp == other.webp &&
          webpSize == other.webpSize;

  @override
  int get hashCode =>
      super.hashCode ^
      (mp4?.hashCode ?? 0) ^
      (mp4Size?.hashCode ?? 0) ^
      (webp?.hashCode ?? 0) ^
      (webpSize?.hashCode ?? 0);
}

/// The description of an original image
class GiphyOriginalImage extends GiphyImage {
  /// Creates a new original image
  const GiphyOriginalImage({
    required String url,
    required String width,
    required String height,
    required String size,
    required this.frames,
    required this.mp4,
    required this.mp4Size,
    this.webp,
    this.webpSize,
    this.hash,
  }) : super(url, width, height, size);

  /// Creates a new original image from [json]
  factory GiphyOriginalImage.fromJson(Map<String, dynamic> json) =>
      GiphyOriginalImage(
        url: json['url'],
        width: json['width'],
        height: json['height'],
        size: json['size'],
        frames: json['frames'],
        mp4: json['mp4'],
        mp4Size: json['mp4_size'],
        webp: json['webp'],
        webpSize: json['webp_size'],
        hash: json['hash'],
      );

  /// The number of frames in this GIF.
  final String frames;

  /// The number of frames in this GIF as integer.
  int get framesInt => int.parse(frames);

  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The size in bytes of the .MP4 file corresponding to this GIF.
  final String mp4Size;

  /// The size in bytes of the .MP4 file corresponding to this GIF.
  int get mp4SizeInt => int.parse(mp4Size);

  /// The URL for this GIF in .webp format.
  final String? webp;

  /// The size in bytes of the .webp file corresponding to this GIF.
  final String? webpSize;

  /// The size in bytes of the .webp file corresponding to this GIF.
  int? get webpSizeInt => webpSize == null ? null : int.parse(webpSize!);

  /// The hash of the image, not officially supported
  final String? hash;

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..['frames'] = frames
    ..['mp4'] = mp4
    ..['mp4_size'] = mp4Size
    ..['webp'] = webp
    ..['webp_size'] = webpSize
    ..['hash'] = hash;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyOriginalImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size &&
          frames == other.frames &&
          mp4 == other.mp4 &&
          mp4Size == other.mp4Size &&
          webp == other.webp &&
          webpSize == other.webpSize &&
          hash == other.hash;

  @override
  int get hashCode =>
      url.hashCode ^
      width.hashCode ^
      height.hashCode ^
      size.hashCode ^
      frames.hashCode ^
      mp4.hashCode ^
      mp4Size.hashCode ^
      webp.hashCode ^
      webpSize.hashCode ^
      (hash?.hashCode ?? 0);
}

/// A still image (without animation)
class GiphyStillImage extends GiphyImage {
  /// Creates a new still image
  const GiphyStillImage({
    required String url,
    required String width,
    required String height,
    required String size,
  }) : super(url, width, height, size);

  /// Creates a new still image from [json]
  factory GiphyStillImage.fromJson(Map<String, dynamic> json) =>
      GiphyStillImage(
          url: json['url'],
          width: json['width'],
          height: json['height'],
          size: json['size'] ?? '');
}

/// A down-sampled image
class GiphyDownSampledImage extends GiphyImage {
  /// Creates a new down-sampled image
  GiphyDownSampledImage({
    required String url,
    required String width,
    required String height,
    required String size,
    this.webp,
    this.webpSize,
  }) : super(url, width, height, size);

  /// Creates a new down-sampled image from [json]
  factory GiphyDownSampledImage.fromJson(Map<String, dynamic> json) =>
      GiphyDownSampledImage(
          url: json['url'],
          width: json['width'],
          height: json['height'],
          size: json['size'],
          webp: json['webp'],
          webpSize: json['webp_size']);

  /// The URL for this GIF in .webp format.
  final String? webp;

  /// The size in bytes of the .webp file corresponding to this GIF.
  final String? webpSize;

  /// The size in bytes of the .webp file corresponding to this GIF.
  int? get webpSizeInt => webpSize == null ? null : int.parse(webpSize!);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..['webp'] = webp
    ..['webp_size'] = webpSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyDownSampledImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size &&
          webp == other.webp &&
          webpSize == other.webpSize;

  @override
  int get hashCode =>
      super.hashCode ^ webp.hashCode ^ (webpSize?.hashCode ?? 0);
}

/// Data on the 15 second version of the GIF looping.
class GiphyLoopingImage {
  /// Creates a new looping image
  const GiphyLoopingImage({
    required this.mp4,
    this.mp4Size,
  });

  /// Creates a new looping image from [json]
  factory GiphyLoopingImage.fromJson(Map<String, dynamic> json) =>
      GiphyLoopingImage(mp4: json['mp4'], mp4Size: json['mp4_size']);

  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The size of this file in bytes.
  final String? mp4Size;

  /// The size of this file in bytes.
  int? get mp4SizeInt => mp4Size == null ? null : int.parse(mp4Size!);

  /// Converts this image to JSON
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'mp4': mp4, 'mp4_size': mp4Size};

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyLoopingImage &&
          runtimeType == other.runtimeType &&
          mp4 == other.mp4 &&
          mp4Size == other.mp4Size;

  @override
  int get hashCode => mp4.hashCode ^ (mp4Size?.hashCode ?? 0);
}

/// Data on a version of this GIF in .MP4 format limited to 50kb
/// that displays the first 1-2 seconds of the GIF.
class GiphyPreviewImage extends GiphyImage {
  /// Creates a new preview image
  const GiphyPreviewImage({
    required String width,
    required String height,
    required this.mp4,
    required this.mp4Size,
  }) : super(mp4, width, height, mp4Size);

  /// Creates a new preview image from [json]
  factory GiphyPreviewImage.fromJson(Map<String, dynamic> json) =>
      GiphyPreviewImage(
        width: json['width'],
        height: json['height'],
        mp4: json['mp4'] ?? '',
        mp4Size: json['mp4_size'] ?? '',
      );

  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The size of this file in bytes.
  final String mp4Size;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'width': width,
        'height': height,
        'mp4': mp4,
        'mp4_size': mp4Size
      };

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyPreviewImage &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          height == other.height &&
          mp4 == other.mp4 &&
          mp4Size == other.mp4Size;

  @override
  int get hashCode =>
      width.hashCode ^ height.hashCode ^ mp4.hashCode ^ mp4Size.hashCode;
}

/// Data on a version of this GIF downsized.
class GiphyDownSizedImage extends GiphyImage {
  /// Creates a new down-sized image
  GiphyDownSizedImage({
    required String url,
    required String width,
    required String height,
    required String size,
  }) : super(url, width, height, size);

  /// Creates a new down-sized image from [json]
  factory GiphyDownSizedImage.fromJson(Map<String, dynamic> json) =>
      GiphyDownSizedImage(
        url: json['url'],
        width: json['width'],
        height: json['height'],
        size: json['size'],
      );
}

/// A GIF image in .WEBP format
class GiphyWebPImage extends GiphyImage {
  /// Creates a new .WEBP image
  GiphyWebPImage({
    required String url,
    required String width,
    required String height,
    required String size,
  }) : super(url, width, height, size);

  /// Creates a new .WEBP image from [json]
  factory GiphyWebPImage.fromJson(Map<String, dynamic> json) => GiphyWebPImage(
        url: json['url'],
        width: json['width'],
        height: json['height'],
        size: json['size'],
      );
}
