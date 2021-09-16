# enough_giphy

A [GIPHY](https://developers.giphy.com/) client in pure Dart without depending on Flutter. 
Retrieve GIFs, stickers emoji and more using `GiphyClient`.


## Installation
Add this dependency your pubspec.yaml file:

```
dependencies:
  enough_giphy: ^0.1.0
```
The latest version or `enough_giphy` is [![enough_giphy version](https://img.shields.io/pub/v/enough_giphy.svg)](https://pub.dartlang.org/packages/enough_giphy).



## API Documentation
Check out the full API documentation at https://pub.dev/documentation/enough_giphy/latest/

## Usage

Use `enough_giphy` to retrieve data from [GIPHY](https://developers.giphy.com/). 

### Requirements
* Sign up for the mandatory API key for each supported platform at developers.giphy.com, compare https://developers.giphy.com/docs/api#quick-start-guide for details.

### Example Code

```dart
import 'package:enough_giphy/enough_giphy.dart';

main(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart example/enough_giphy_example.dart GIPHY_API_KEY');
    return -1;
  }
  final apiKey = args.first;
  final client = GiphyClient(apiKey: apiKey);

  // Retrieves some trending gifs:
  final gifs = await client.trending();
  print('got ${gifs.totalCount} GIF images in trending');
  final firstGif = await gifs.load(0);
  print('first gif share URL: ${firstGif.recommendedMobileSend.url}');

  // Retrieve trending stickers, including up to PG13 rating:
  final stickers = await client.trending(
    type: GiphyType.stickers,
    rating: GiphyRating.pg13,
    lang: GiphyLanguage.english,
  );
  final firstSticker = await stickers.load(0);
  print(
      'first sticker preview URL: ${firstSticker.recommendedMobileKeyboard.url}');

  // Retrieve emoji:
  final emojis = await client.emojis();
  final secondEmoji = await emojis.load(1);
  print('got emoji preview URL: ${secondEmoji.recommendedMobileKeyboard.url}');

  // Search for cat GIFs:
  final catSearch = await client.search('cat');
  print('got ${catSearch.totalCount} cats');
  final firstCat = await catSearch.load(0);
  print('first cat share URL: ${firstCat.recommendedMobileSend.url}');

  // Search for GIFs from a specific user:
  final userSearch = await client.search('@pusheen');
  print('got ${userSearch.totalCount} results for user search');

  // Get trending search terms:
  final trendingSearchTerms = await client.trendingSearchTerms();
  print('trending search terms: $trendingSearchTerms');

  // Always close connection at the end:
  client.close();
}
```

### Report Issues
Please help development by [reporting issues](https://github.com/Enough-Software/enough_giphy/issues), pull requests are also welcome!

## License
`enough_giphy` is licensed under the commercial friendly [Mozilla Public License 2.0](LICENSE)

## Related Projects
* Use [enough_giphy_flutter](https://pub.dev/packages/enough_giphy_flutter) to integrate a powerful and customizable GIPHY picker into your Flutter app.

