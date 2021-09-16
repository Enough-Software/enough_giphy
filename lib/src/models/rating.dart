enum GiphyRating {
  /// level 1 - General Audience
  ///
  /// All Ages Admitted.
  g,

  /// level 2 - Parental Guidance Suggested
  ///
  /// Some Material May Not Be Suitable For Children.
  pg,

  /// level 3 - Parents Strongly Cautioned
  ///
  /// Some Material May Be Inappropriate For Children Under 13.
  pg13,

  /// level 4 - R — Restricted.
  ///
  /// Children Under 17 Require Accompanying Parent or Adult Guardian.
  r,
}

extension ExtensionGiphyRating on GiphyRating {
  /// Retrieves the parameter name for the given content rating
  String get name {
    switch (this) {
      case GiphyRating.g:
        return 'g';
      case GiphyRating.pg:
        return 'pg';
      case GiphyRating.pg13:
        return 'pg13';
      case GiphyRating.r:
        return 'r';
    }
  }
}
