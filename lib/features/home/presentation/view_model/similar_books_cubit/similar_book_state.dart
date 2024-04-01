part of 'similar_book_cubit.dart';

@immutable
abstract class SimilarBookState {}

class SimilarBookInitial extends SimilarBookState {}

class SimilarBookLoading extends SimilarBookState {}

class SimilarBookSuccess extends SimilarBookState {
  final List<BookModel> books;
  SimilarBookSuccess(this.books);
}

class SimilarBookFailure extends SimilarBookState {
  final String errMessage;
  SimilarBookFailure(this.errMessage);
}
