import 'gif.dart';

/// Contains a number of GIF resources
class GiphyCollection {
  /// Creates a new giphy collection
  const GiphyCollection({
    required this.data,
    this.pagination,
    this.meta,
  });

  /// Creates a new giphy collection from [json]
  factory GiphyCollection.fromJson(Map<String, dynamic> json) =>
      GiphyCollection(
        data: json.containsKey('data')
            // ignore: unnecessary_lambdas
            ? (json['data'] as List).map((e) => GiphyGif.fromJson(e)).toList()
            : [],
        pagination: json['pagination'] == null
            ? null
            : GiphyPagination.fromJson(
                json['pagination'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : GiphyMeta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  /// The actual GIF resources
  final List<GiphyGif> data;

  /// Pagination information, if present
  final GiphyPagination? pagination;

  /// Additional optional meta information
  final GiphyMeta? meta;

  /// Returns `true` when this collection contains at least 1 gif [data] element
  bool get isNotEmpty => !isEmpty;

  /// Returns `true` when this collection contains 0 gif [data] elements
  bool get isEmpty => (pagination?.totalCount == 0) || data.isEmpty;

  /// Creates JSON from this collection
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'data': data, 'pagination': pagination, 'meta': meta};

  @override
  String toString() =>
      'GiphyCollection{data: $data, pagination: $pagination, meta: $meta}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyCollection &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          pagination == other.pagination &&
          meta == other.meta;

  @override
  int get hashCode => data.hashCode ^ pagination.hashCode ^ meta.hashCode;
}

/// Provides pagination information for a [GiphyCollection]
class GiphyPagination {
  /// Creates a new pagination
  const GiphyPagination({
    required this.totalCount,
    required this.count,
    required this.offset,
    required this.nextCursor,
  });

  /// Creates a new pagination from [json]
  factory GiphyPagination.fromJson(Map<String, dynamic> json) =>
      GiphyPagination(
        totalCount: json['total_count'],
        count: json['count'],
        offset: json['offset'],
        nextCursor: json['next_cursor'],
      );

  /// The number of all elements
  ///
  /// Not null when [nextCursor] is null.
  final int? totalCount;

  /// The number of loaded elements in the current page
  final int count;

  /// The current offset for the page data
  final int offset;

  /// Next cursor.
  ///
  /// Not null when [totalCount] is null.
  final int? nextCursor;

  /// Converts the pagination to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'total_count': totalCount,
        'count': count,
        'offset': offset
      };

  @override
  String toString() => 'GiphyPagination{totalCount: $totalCount, '
      'count: $count, '
      'offset: $offset}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyPagination &&
          runtimeType == other.runtimeType &&
          totalCount == other.totalCount &&
          count == other.count &&
          offset == other.offset;

  @override
  int get hashCode => totalCount.hashCode ^ count.hashCode ^ offset.hashCode;
}

/// Provides meta data for a [GiphyCollection]
class GiphyMeta {
  /// Creates a new meta object
  const GiphyMeta(
      {required this.status, required this.msg, required this.responseId});

  /// Creates a new meta object from [json]

  factory GiphyMeta.fromJson(Map<String, dynamic> json) => GiphyMeta(
        status: json['status'] as int,
        msg: json['msg'] as String,
        responseId: json['response_id'] as String,
      );

  /// The HTTP status code
  final int status;

  /// The received message
  final String msg;

  /// The ID of the response
  final String responseId;

  /// Converts the meta data to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'msg': msg,
        'response_id': responseId
      };

  @override
  String toString() =>
      'GiphyMeta{status: $status, msg: $msg, responseId: $responseId}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiphyMeta &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          msg == other.msg &&
          responseId == other.responseId;

  @override
  int get hashCode => status.hashCode ^ msg.hashCode ^ responseId.hashCode;
}
