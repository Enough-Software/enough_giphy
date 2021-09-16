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
