import 'image.dart';

/// Contains the different available formats for this GIPHY image.
///
/// Compare https://developers.giphy.com/docs/optional-settings/#rendition-guide for when to use which version.
/// Compare https://developers.giphy.com/docs/api/schema#image-object for a description.
/// Compare the `recommendedXXX` getter for follwoing the rendition-guide for some popular use cases.
class GiphyImages {
  /// Data on versions of this GIF with a fixed height of 200 pixels. Good for mobile use.
  GiphyFullImage? fixedHeight;

  /// Data on a static image of this GIF with a fixed height of 200 pixels.
  GiphyStillImage fixedHeightStill;

  /// Data on versions of this GIF with a fixed height of 200 pixels and the number of frames reduced to 6.
  GiphyDownsampledImage? fixedHeightDownsampled;

  /// Data on versions of this GIF with a fixed height of 100 pixels. Good for mobile keyboards.
  GiphyFullImage? fixedHeightSmall;

  /// Data on a static image of this GIF with a fixed height of 100 pixels.
  GiphyStillImage? fixedHeightSmallStill;

  /// Data on versions of this GIF with a fixed width of 200 pixels. Good for mobile use.
  GiphyFullImage fixedWidth;

  /// Data on a static image of this GIF with a fixed width of 200 pixels.
  GiphyStillImage? fixedWidthStill;

  /// Data on versions of this GIF with a fixed width of 200 pixels and the number of frames reduced to 6.
  GiphyDownsampledImage? fixedWidthDownsampled;

  /// Data on versions of this GIF with a fixed width of 100 pixels. Good for mobile keyboards.
  GiphyFullImage? fixedWidthSmall;

  /// Data on a static image of this GIF with a fixed width of 100 pixels.
  GiphyStillImage? fixedWidthSmallStill;

  /// Data on a version of this GIF downsized to be under 2mb.
  GiphyDownsizedImage? downsized;

  /// Data on a version of this GIF downsized to be under 200kb.
  GiphyPreviewImage? downsizedSmall;

  /// Data on a version of this GIF downsized to be under 5mb.
  GiphyPreviewImage? downsizedMedium;

  /// Data on a version of this GIF downsized to be under 8mb.
  GiphyDownsizedImage? downsizedLarge;

  /// Data on a static preview image of the downsized version of this GIF.
  GiphyStillImage? downsizedStill;

  /// Data on the original version of this GIF. Good for desktop use.
  GiphyOriginalImage? original;

  /// Data on a static preview image of the original GIF.
  GiphyStillImage originalStill;

  /// Data on the 15 second version of the GIF looping.
  GiphyLoopingImage? looping;

  /// Data on a version of this GIF in .MP4 format limited to 50kb that displays the first 1-2 seconds of the GIF.
  GiphyPreviewImage? preview;

  /// Data on a version of this GIF limited to 50kb that displays the first 1-2 seconds of the GIF.
  GiphyDownsizedImage? previewGif;

  /// Data on a version of this GIF in .WEBP format limited to 50kb that displays the first 1-2 seconds of the GIF.
  GiphyWebPImage? previewWebp;

  /// The high definition version, not officially supported
  GiphyPreviewImage? hd;

  /// The original MP4 version, not officially supported
  GiphyPreviewImage? originalMp4;

  /// Data on a static image with a fixed width of 480 pixels, not officially supported
  GiphyStillImage? w480Still;

  /// Creates a new images object
  GiphyImages({
    required this.fixedHeightStill,
    required this.originalStill,
    required this.fixedWidth,
    this.fixedHeightSmallStill,
    this.fixedHeightDownsampled,
    this.preview,
    this.fixedHeightSmall,
    this.downsizedStill,
    this.downsized,
    this.downsizedLarge,
    this.fixedWidthSmallStill,
    this.previewWebp,
    this.fixedWidthStill,
    this.fixedWidthSmall,
    this.downsizedSmall,
    this.fixedWidthDownsampled,
    this.downsizedMedium,
    this.original,
    this.fixedHeight,
    this.hd,
    this.looping,
    this.originalMp4,
    this.previewGif,
    this.w480Still,
  });

  factory GiphyImages.fromJson(Map<String, dynamic> json) {
    return GiphyImages(
      fixedHeightStill: GiphyStillImage.fromJson(json['fixed_height_still']),
      originalStill: GiphyStillImage.fromJson(json['original_still']),
      fixedWidth: GiphyFullImage.fromJson(json['fixed_width']),
      fixedHeightSmallStill: json['fixed_height_small_still'] == null ||
              (json['fixed_height_small_still'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyStillImage.fromJson(json['fixed_height_small_still']),
      fixedHeightDownsampled: json['fixed_height_downsampled'] == null ||
              (json['fixed_height_downsampled'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyDownsampledImage.fromJson(json['fixed_height_downsampled']),
      preview: json['preview'] == null ||
              (json['preview'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyPreviewImage.fromJson(json['preview']),
      fixedHeightSmall: json['fixed_height_small'] == null ||
              (json['fixed_height_small'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyFullImage.fromJson(json['fixed_height_small']),
      downsizedStill: json['downsized_still'] == null ||
              (json['downsized_still'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyStillImage.fromJson(json['downsized_still']),
      downsized: json['downsized'] == null ||
              (json['downsized'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyDownsizedImage.fromJson(json['downsized']),
      downsizedLarge: json['downsized_large'] == null ||
              (json['downsized_large'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyDownsizedImage.fromJson(json['downsized_large']),
      fixedWidthSmallStill: json['fixed_width_small_still'] == null ||
              (json['fixed_width_small_still'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyStillImage.fromJson(json['fixed_width_small_still']),
      previewWebp: json['preview_webp'] == null ||
              (json['preview_webp'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyWebPImage.fromJson(json['preview_webp']),
      fixedWidthStill: json['fixed_width_still'] == null ||
              (json['fixed_width_still'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyStillImage.fromJson(json['fixed_width_still']),
      fixedWidthSmall: json['fixed_width_small'] == null ||
              (json['fixed_width_small'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyFullImage.fromJson(json['fixed_width_small']),
      downsizedSmall: json['downsized_small'] == null ||
              (json['downsized_small'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyPreviewImage.fromJson(json['downsized_small']),
      fixedWidthDownsampled: json['fixed_width_downsampled'] == null ||
              (json['fixed_width_downsampled'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyDownsampledImage.fromJson(json['fixed_width_downsampled']),
      downsizedMedium: json['downsized_medium'] == null ||
              (json['downsized_medium'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyPreviewImage.fromJson(json['downsized_medium']),
      original: json['original'] == null ||
              (json['original'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyOriginalImage.fromJson(json['original']),
      fixedHeight: json['fixed_height'] == null ||
              (json['fixed_height'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyFullImage.fromJson(json['fixed_height']),
      hd: json['hd'] == null ? null : GiphyPreviewImage.fromJson(json['hd']),
      looping: json['looping'] == null ||
              (json['looping'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyLoopingImage.fromJson(json['looping']),
      originalMp4: json['original_mp4'] == null ||
              (json['original_mp4'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyPreviewImage.fromJson(json['original_mp4']),
      previewGif: json['preview_gif'] == null ||
              (json['preview_gif'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyDownsizedImage.fromJson(json['preview_gif']),
      w480Still: json['480w_still'] == null ||
              (json['480w_still'] as Map<String, dynamic>).isEmpty
          ? null
          : GiphyStillImage.fromJson(json['480w_still']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fixed_height_still': fixedHeightStill.toJson(),
      'original_still': originalStill.toJson(),
      'fixed_width': fixedWidth.toJson(),
      'fixed_height_small_still': fixedHeightSmallStill?.toJson(),
      'fixed_height_downsampled': fixedHeightDownsampled?.toJson(),
      'preview': preview?.toJson(),
      'fixed_height_small': fixedHeightSmall?.toJson(),
      'downsized_still': downsizedStill?.toJson(),
      'downsized': downsized?.toJson(),
      'downsized_large': downsizedLarge?.toJson(),
      'fixed_width_small_still': fixedWidthSmallStill?.toJson(),
      'preview_webp': previewWebp?.toJson(),
      'fixed_width_still': fixedWidthStill?.toJson(),
      'fixed_width_small': fixedWidthSmall?.toJson(),
      'downsized_small': downsizedSmall?.toJson(),
      'fixed_width_downsampled': fixedWidthDownsampled?.toJson(),
      'downsized_medium': downsizedMedium?.toJson(),
      'original': original?.toJson(),
      'fixed_height': fixedHeight?.toJson(),
      'hd': hd?.toJson(),
      'looping': looping?.toJson(),
      'original_mp4': originalMp4?.toJson(),
      'preview_gif': previewGif?.toJson(),
      '480w_still': w480Still?.toJson()
    };
  }

  @override
  String toString() {
    return 'GiphyImages{fixedHeightStill: $fixedHeightStill, originalStill: $originalStill, fixedWidth: $fixedWidth, fixedHeightSmallStill: $fixedHeightSmallStill, fixedHeightDownsampled: $fixedHeightDownsampled, preview: $preview, fixedHeightSmall: $fixedHeightSmall, downsizedStill: $downsizedStill, downsized: $downsized, downsizedLarge: $downsizedLarge, fixedWidthSmallStill: $fixedWidthSmallStill, previewWebp: $previewWebp, fixedWidthStill: $fixedWidthStill, fixedWidthSmall: $fixedWidthSmall, downsizedSmall: $downsizedSmall, fixedWidthDownsampled: $fixedWidthDownsampled, downsizedMedium: $downsizedMedium, original: $original, fixedHeight: $fixedHeight, hd: $hd, looping: $looping, originalMp4: $originalMp4, previewGif: $previewGif, w480Still: $w480Still}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyImages &&
          runtimeType == other.runtimeType &&
          fixedHeightStill == other.fixedHeightStill &&
          originalStill == other.originalStill &&
          fixedWidth == other.fixedWidth &&
          fixedHeightSmallStill == other.fixedHeightSmallStill &&
          fixedHeightDownsampled == other.fixedHeightDownsampled &&
          preview == other.preview &&
          fixedHeightSmall == other.fixedHeightSmall &&
          downsizedStill == other.downsizedStill &&
          downsized == other.downsized &&
          downsizedLarge == other.downsizedLarge &&
          fixedWidthSmallStill == other.fixedWidthSmallStill &&
          previewWebp == other.previewWebp &&
          fixedWidthStill == other.fixedWidthStill &&
          fixedWidthSmall == other.fixedWidthSmall &&
          downsizedSmall == other.downsizedSmall &&
          fixedWidthDownsampled == other.fixedWidthDownsampled &&
          downsizedMedium == other.downsizedMedium &&
          original == other.original &&
          fixedHeight == other.fixedHeight &&
          hd == other.hd &&
          looping == other.looping &&
          originalMp4 == other.originalMp4 &&
          previewGif == other.previewGif &&
          w480Still == other.w480Still;

  @override
  int get hashCode =>
      fixedHeightStill.hashCode ^
      originalStill.hashCode ^
      fixedWidth.hashCode ^
      fixedHeightSmallStill.hashCode ^
      fixedHeightDownsampled.hashCode ^
      preview.hashCode ^
      fixedHeightSmall.hashCode ^
      downsizedStill.hashCode ^
      downsized.hashCode ^
      downsizedLarge.hashCode ^
      fixedWidthSmallStill.hashCode ^
      previewWebp.hashCode ^
      fixedWidthStill.hashCode ^
      fixedWidthSmall.hashCode ^
      downsizedSmall.hashCode ^
      fixedWidthDownsampled.hashCode ^
      downsizedMedium.hashCode ^
      original.hashCode ^
      fixedHeight.hashCode ^
      hd.hashCode ^
      looping.hashCode ^
      originalMp4.hashCode ^
      previewGif.hashCode ^
      w480Still.hashCode;
}
