/// Base class for immages
class GiphyImage {
  /// Creates a new image
  GiphyImage(this.url, this.width, this.height, this.size);

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
}

/// A full image description
class GiphyFullImage extends GiphyImage {
  /// Optional URL of the MP4 data
  final String? mp4;

  /// Optional size of the MP4 data in bytes
  final String? mp4Size;

  /// Optional URL of the WEBP data
  final String? webp;

  /// Optional size of the WEBP data in bytes
  final String? webpSize;

  GiphyFullImage({
    required String url,
    required String width,
    required String height,
    required String size,
    this.mp4,
    this.mp4Size,
    this.webp,
    this.webpSize,
  }) : super(url, width, height, size);

  factory GiphyFullImage.fromJson(Map<String, dynamic> json) => GiphyFullImage(
      url: json['url'],
      width: json['width'],
      height: json['height'],
      size: json['size'],
      mp4: json['mp4'],
      mp4Size: json['mp4_size'],
      webp: json['webp'],
      webpSize: json['webp_size']);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
      'size': size,
      'mp4': mp4,
      'mp4_size': mp4Size,
      'webp': webp,
      'webp_size': webpSize
    };
  }

  @override
  String toString() {
    return 'GiphyFullImage{url: $url, width: $width, height: $height, size: $size, mp4: $mp4, mp4Size: $mp4Size, webp: $webp, webpSize: $webpSize}';
  }

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
      url.hashCode ^
      width.hashCode ^
      height.hashCode ^
      size.hashCode ^
      mp4.hashCode ^
      mp4Size.hashCode ^
      webp.hashCode ^
      webpSize.hashCode;
}

/// The description of an original image
class GiphyOriginalImage extends GiphyImage {
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

  /// The hash of the image, not offically supported
  final String hash;

  /// Creates a new original image
  GiphyOriginalImage({
    required String url,
    required String width,
    required String height,
    required String size,
    required this.frames,
    required this.mp4,
    required this.mp4Size,
    this.webp,
    this.webpSize,
    required this.hash,
  }) : super(url, width, height, size);

  factory GiphyOriginalImage.fromJson(Map<String, dynamic> json) {
    return GiphyOriginalImage(
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
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
      'size': size,
      'frames': frames,
      'mp4': mp4,
      'mp4_size': mp4Size,
      'webp': webp,
      'webp_size': webpSize,
      'hash': hash
    };
  }

  @override
  String toString() {
    return 'GiphyOriginalImage{url: $url, width: $width, height: $height, size: $size, frames: $frames, mp4: $mp4, mp4Size: $mp4Size, webp: $webp, webpSize: $webpSize, hash: $hash}';
  }

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
      hash.hashCode;
}

class GiphyStillImage extends GiphyImage {
  GiphyStillImage({
    required String url,
    required String width,
    required String height,
    required String size,
  }) : super(url, width, height, size);

  factory GiphyStillImage.fromJson(Map<String, dynamic> json) =>
      GiphyStillImage(
          url: json['url'],
          width: json['width'],
          height: json['height'],
          size: json['size'] ?? '');

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
      'size': size
    };
  }

  @override
  String toString() {
    return 'GiphyStillImage{url: $url, width: $width, height: $height, size: $size}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyStillImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size;

  @override
  int get hashCode =>
      url.hashCode ^ width.hashCode ^ height.hashCode ^ size.hashCode;
}

/// A downsampled image
class GiphyDownsampledImage extends GiphyImage {
  /// The URL for this GIF in .webp format.
  final String? webp;

  /// The size in bytes of the .webp file corresponding to this GIF.
  final String? webpSize;

  /// The size in bytes of the .webp file corresponding to this GIF.
  int? get webpSizeInt => webpSize == null ? null : int.parse(webpSize!);

  /// Creates a new downsampled image
  GiphyDownsampledImage({
    required String url,
    required String width,
    required String height,
    required String size,
    this.webp,
    this.webpSize,
  }) : super(url, width, height, size);

  factory GiphyDownsampledImage.fromJson(Map<String, dynamic> json) {
    return GiphyDownsampledImage(
        url: json['url'],
        width: json['width'],
        height: json['height'],
        size: json['size'],
        webp: json['webp'],
        webpSize: json['webp_size']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
      'size': size,
      'webp': webp,
      'webp_size': webpSize
    };
  }

  @override
  String toString() {
    return 'GiphyDownsampledImage{url: $url, width: $width, height: $height, size: $size, webp: $webp, webpSize: $webpSize}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyDownsampledImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size &&
          webp == other.webp &&
          webpSize == other.webpSize;

  @override
  int get hashCode =>
      url.hashCode ^
      width.hashCode ^
      height.hashCode ^
      size.hashCode ^
      webp.hashCode ^
      webpSize.hashCode;
}

/// Data on the 15 second version of the GIF looping.
class GiphyLoopingImage {
  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The size of this file in bytes.
  final String? mp4Size;

  /// The size of this file in bytes.
  int? get mp4SizeInt => mp4Size == null ? null : int.parse(mp4Size!);

  /// Creates a new looping image
  GiphyLoopingImage({
    required this.mp4,
    this.mp4Size,
  });

  factory GiphyLoopingImage.fromJson(Map<String, dynamic> json) =>
      GiphyLoopingImage(mp4: json['mp4'], mp4Size: json['mp4_size']);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'mp4': mp4, 'mp4_size': mp4Size};

  @override
  String toString() {
    return 'GiphyLoopingImage{mp4: $mp4, mp4Size: $mp4Size}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyLoopingImage &&
          runtimeType == other.runtimeType &&
          mp4 == other.mp4 &&
          mp4Size == other.mp4Size;

  @override
  int get hashCode => mp4.hashCode ^ mp4Size.hashCode;
}

/// Data on a version of this GIF in .MP4 format limited to 50kb that displays the first 1-2 seconds of the GIF.
class GiphyPreviewImage extends GiphyImage {
  /// The URL for this GIF in .MP4 format.
  final String mp4;

  /// The size of this file in bytes.
  final String mp4Size;

  /// Creates a new preview image
  GiphyPreviewImage({
    required String width,
    required String height,
    required this.mp4,
    required this.mp4Size,
  }) : super(mp4, width, height, mp4Size);

  factory GiphyPreviewImage.fromJson(Map<String, dynamic> json) {
    return GiphyPreviewImage(
      width: json['width'],
      height: json['height'],
      mp4: json['mp4'] ?? '',
      mp4Size: json['mp4_size'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'mp4': mp4,
      'mp4_size': mp4Size
    };
  }

  @override
  String toString() {
    return 'GiphyPreviewImage{width: $width, height: $height, mp4: $mp4, mp4Size: $mp4Size}';
  }

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
class GiphyDownsizedImage extends GiphyImage {
  /// Creates a new downsizedimage
  GiphyDownsizedImage({
    required String url,
    required String width,
    required String height,
    required String size,
  }) : super(url, width, height, size);

  factory GiphyDownsizedImage.fromJson(Map<String, dynamic> json) {
    return GiphyDownsizedImage(
      url: json['url'],
      width: json['width'],
      height: json['height'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
      'size': size
    };
  }

  @override
  String toString() {
    return 'GiphyDownsizedImage{url: $url, width: $width, height: $height, size: $size}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyDownsizedImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size;

  @override
  int get hashCode =>
      url.hashCode ^ width.hashCode ^ height.hashCode ^ size.hashCode;
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

  factory GiphyWebPImage.fromJson(Map<String, dynamic> json) {
    return GiphyWebPImage(
      url: json['url'],
      width: json['width'],
      height: json['height'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
      'size': size
    };
  }

  @override
  String toString() {
    return 'GiphyWebPImage{url: $url, width: $width, height: $height, size: $size}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyWebPImage &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height &&
          size == other.size;

  @override
  int get hashCode =>
      url.hashCode ^ width.hashCode ^ height.hashCode ^ size.hashCode;
}
