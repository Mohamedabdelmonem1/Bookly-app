part of 'search_book_cubit.dart';

@immutable
abstract class SearchBookState {}

class SearchBookInitial extends SearchBookState {}

class SearchBookLoading extends SearchBookState {}

class SearchBookSuccess extends SearchBookState {
  final List<BookModel> books;
  SearchBookSuccess(this.books);
}

class SearchBookFailure extends SearchBookState {
  final String errMessage;
  SearchBookFailure(this.errMessage);
}

