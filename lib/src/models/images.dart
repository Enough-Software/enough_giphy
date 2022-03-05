import 'image.dart';

/// Contains the different available formats for this GIPHY image.
///
/// Compare https://developers.giphy.com/docs/optional-settings/#rendition-guide
/// for when to use which version.
///
/// Compare https://developers.giphy.com/docs/api/schema#image-object for
/// a description.
///
/// Compare the `recommendedXXX` getter for following the rendition-guide for
/// some popular use cases.
class GiphyImages {
  /// Creates a new images object
  GiphyImages({
    required this.fixedHeightStill,
    required this.originalStill,
    required this.fixedWidth,
    this.fixedHeightSmallStill,
    this.fixedHeightDownSampled,
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
    this.fixedWidthDownSampled,
    this.downsizedMedium,
    this.original,
    this.fixedHeight,
    this.hd,
    this.looping,
    this.originalMp4,
    this.previewGif,
    this.w480Still,
  });

  /// Creates a new images object from [json]
  factory GiphyImages.fromJson(Map<String, dynamic> json) => GiphyImages(
        fixedHeightStill: GiphyStillImage.fromJson(json['fixed_height_still']),
        originalStill: GiphyStillImage.fromJson(json['original_still']),
        fixedWidth: GiphyFullImage.fromJson(json['fixed_width']),
        fixedHeightSmallStill: json['fixed_height_small_still'] == null ||
                (json['fixed_height_small_still'] as Map<String, dynamic>)
                    .isEmpty
            ? null
            : GiphyStillImage.fromJson(json['fixed_height_small_still']),
        fixedHeightDownSampled: json['fixed_height_downsampled'] == null ||
                (json['fixed_height_downsampled'] as Map<String, dynamic>)
                    .isEmpty
            ? null
            : GiphyDownSampledImage.fromJson(json['fixed_height_downsampled']),
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
            : GiphyDownSizedImage.fromJson(json['downsized']),
        downsizedLarge: json['downsized_large'] == null ||
                (json['downsized_large'] as Map<String, dynamic>).isEmpty
            ? null
            : GiphyDownSizedImage.fromJson(json['downsized_large']),
        fixedWidthSmallStill: json['fixed_width_small_still'] == null ||
                (json['fixed_width_small_still'] as Map<String, dynamic>)
                    .isEmpty
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
        fixedWidthDownSampled: json['fixed_width_downsampled'] == null ||
                (json['fixed_width_downsampled'] as Map<String, dynamic>)
                    .isEmpty
            ? null
            : GiphyDownSampledImage.fromJson(json['fixed_width_downsampled']),
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
            : GiphyDownSizedImage.fromJson(json['preview_gif']),
        w480Still: json['480w_still'] == null ||
                (json['480w_still'] as Map<String, dynamic>).isEmpty
            ? null
            : GiphyStillImage.fromJson(json['480w_still']),
      );

  /// Data on versions of this GIF with a fixed height of 200 pixels.
  /// Good for mobile use.
  final GiphyFullImage? fixedHeight;

  /// Data on a static image of this GIF with a fixed height of 200 pixels.
  final GiphyStillImage fixedHeightStill;

  /// Data on versions of this GIF with a fixed height of 200 pixels
  /// and the number of frames reduced to 6.
  final GiphyDownSampledImage? fixedHeightDownSampled;

  /// Data on versions of this GIF with a fixed height of 100 pixels.
  /// Good for mobile keyboards.
  final GiphyFullImage? fixedHeightSmall;

  /// Data on a static image of this GIF with a fixed height of 100 pixels.
  final GiphyStillImage? fixedHeightSmallStill;

  /// Data on versions of this GIF with a fixed width of 200 pixels.
  /// Good for mobile use.
  final GiphyFullImage fixedWidth;

  /// Data on a static image of this GIF with a fixed width of 200 pixels.
  final GiphyStillImage? fixedWidthStill;

  /// Data on versions of this GIF with a fixed width of 200 pixels
  /// and the number of frames reduced to 6.
  final GiphyDownSampledImage? fixedWidthDownSampled;

  /// Data on versions of this GIF with a fixed width of 100 pixels.
  /// Good for mobile keyboards.
  final GiphyFullImage? fixedWidthSmall;

  /// Data on a static image of this GIF with a fixed width of 100 pixels.
  final GiphyStillImage? fixedWidthSmallStill;

  /// Data on a version of this GIF downsized to be under 2mb.
  final GiphyDownSizedImage? downsized;

  /// Data on a version of this GIF downsized to be under 200kb.
  final GiphyPreviewImage? downsizedSmall;

  /// Data on a version of this GIF downsized to be under 5mb.
  final GiphyPreviewImage? downsizedMedium;

  /// Data on a version of this GIF downsized to be under 8mb.
  final GiphyDownSizedImage? downsizedLarge;

  /// Data on a static preview image of the downsized version of this GIF.
  final GiphyStillImage? downsizedStill;

  /// Data on the original version of this GIF. Good for desktop use.
  final GiphyOriginalImage? original;

  /// Data on a static preview image of the original GIF.
  final GiphyStillImage originalStill;

  /// Data on the 15 second version of the GIF looping.
  final GiphyLoopingImage? looping;

  /// Data on a version of this GIF in .MP4 format
  /// limited to 50kb that displays the first 1-2 seconds of the GIF.
  final GiphyPreviewImage? preview;

  /// Data on a version of this GIF limited to 50kb
  /// that displays the first 1-2 seconds of the GIF.
  final GiphyDownSizedImage? previewGif;

  /// Data on a version of this GIF in .WEBP format limited to 50kb
  /// that displays the first 1-2 seconds of the GIF.
  final GiphyWebPImage? previewWebp;

  /// The high definition version, not officially supported
  final GiphyPreviewImage? hd;

  /// The original MP4 version, not officially supported
  final GiphyPreviewImage? originalMp4;

  /// Data on a static image with a fixed width of 480 pixels,
  /// not officially supported
  final GiphyStillImage? w480Still;

  /// Converts his image to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'fixed_height_still': fixedHeightStill.toJson(),
        'original_still': originalStill.toJson(),
        'fixed_width': fixedWidth.toJson(),
        'fixed_height_small_still': fixedHeightSmallStill?.toJson(),
        'fixed_height_downsampled': fixedHeightDownSampled?.toJson(),
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
        'fixed_width_downsampled': fixedWidthDownSampled?.toJson(),
        'downsized_medium': downsizedMedium?.toJson(),
        'original': original?.toJson(),
        'fixed_height': fixedHeight?.toJson(),
        'hd': hd?.toJson(),
        'looping': looping?.toJson(),
        'original_mp4': originalMp4?.toJson(),
        'preview_gif': previewGif?.toJson(),
        '480w_still': w480Still?.toJson()
      };

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      'GiphyImages{fixedHeightStill: $fixedHeightStill, originalStill: $originalStill, fixedWidth: $fixedWidth, fixedHeightSmallStill: $fixedHeightSmallStill, fixedHeightDownsampled: $fixedHeightDownSampled, preview: $preview, fixedHeightSmall: $fixedHeightSmall, downsizedStill: $downsizedStill, downsized: $downsized, downsizedLarge: $downsizedLarge, fixedWidthSmallStill: $fixedWidthSmallStill, previewWebp: $previewWebp, fixedWidthStill: $fixedWidthStill, fixedWidthSmall: $fixedWidthSmall, downsizedSmall: $downsizedSmall, fixedWidthDownsampled: $fixedWidthDownSampled, downsizedMedium: $downsizedMedium, original: $original, fixedHeight: $fixedHeight, hd: $hd, looping: $looping, originalMp4: $originalMp4, previewGif: $previewGif, w480Still: $w480Still}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyImages &&
          runtimeType == other.runtimeType &&
          fixedHeightStill == other.fixedHeightStill &&
          originalStill == other.originalStill &&
          fixedWidth == other.fixedWidth &&
          fixedHeightSmallStill == other.fixedHeightSmallStill &&
          fixedHeightDownSampled == other.fixedHeightDownSampled &&
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
          fixedWidthDownSampled == other.fixedWidthDownSampled &&
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
      (fixedHeightSmallStill?.hashCode ?? 0) ^
      (fixedHeightDownSampled?.hashCode ?? 0) ^
      (preview?.hashCode ?? 0) ^
      (fixedHeightSmall?.hashCode ?? 0) ^
      (downsizedStill?.hashCode ?? 0) ^
      (downsized?.hashCode ?? 0) ^
      (downsizedLarge?.hashCode ?? 0) ^
      (fixedWidthSmallStill?.hashCode ?? 0) ^
      (previewWebp?.hashCode ?? 0) ^
      (fixedWidthStill?.hashCode ?? 0) ^
      (fixedWidthSmall?.hashCode ?? 0) ^
      (downsizedSmall?.hashCode ?? 0) ^
      (fixedWidthDownSampled?.hashCode ?? 0) ^
      (downsizedMedium?.hashCode ?? 0) ^
      (original?.hashCode ?? 0) ^
      (fixedHeight?.hashCode ?? 0) ^
      (hd?.hashCode ?? 0) ^
      (looping?.hashCode ?? 0) ^
      (originalMp4?.hashCode ?? 0) ^
      (previewGif?.hashCode ?? 0) ^
      (w480Still?.hashCode ?? 0);
}
