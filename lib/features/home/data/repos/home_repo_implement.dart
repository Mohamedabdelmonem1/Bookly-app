import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await Api().get(
        url:
            "https://www.googleapis.com/books/v1/volumes?q=computer science&Filtering=free-ebooks&Sorting=newest",
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBooks() async {
    try {
      var data = await Api().get(
        url:
            "https://www.googleapis.com/books/v1/volumes?q=programming&Filtering=free-ebooks",
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await Api().get(
        url:
            "https://www.googleapis.com/books/v1/volumes?q=$category&Filtering=free-ebooks&Sorting=relevance",
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
