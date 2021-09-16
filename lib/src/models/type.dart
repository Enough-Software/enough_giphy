/// The requested content type
enum GiphyType { gifs, stickers, emoji }

extension ExtensionGiphyType on GiphyType {
  String get name {
    switch (this) {
      case GiphyType.gifs:
        return 'gifs';
      case GiphyType.stickers:
        return 'stickers';
      case GiphyType.emoji:
        return 'emoji';
    }
  }
}
