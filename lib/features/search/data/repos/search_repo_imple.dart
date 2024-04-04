import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement implements SearchRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String searchName}) async {
    try {
      var data = await Api().get(
        url:
            "https://www.googleapis.com/books/v1/volumes?q=$searchName&Filtering=free-ebooks",
      );
      List<BookModel> books = [];
      for (int i = 0; i < data['items'].length; i++) {
        books.add(BookModel.fromJson(data['items'][i]));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }
}
