import 'package:hive/hive.dart';
part 'book_entity.g.dart';


@HiveType(typeId: 0)
class BookEntity{

  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? authorName;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final String bookId;
  @HiveField(6)
  final num? ratingsCount;
  @HiveField(7)
  final List<String>? categories;
  @HiveField(8)
  final String? previewLink;
  BookEntity({required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.bookId,
    required this.ratingsCount,
    required this.categories,
    this.previewLink
  });

}