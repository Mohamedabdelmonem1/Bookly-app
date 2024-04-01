import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly_app/features/home/presentation/view_model/similar_books_cubit/similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBookCubit(HomeRepoImplement())..fetchSimilarBooks(
          category: bookModel.volumeInfo!.categories![0]),
      child: SafeArea(
        child: Scaffold(
          body: BookDetailsViewBody(
            bookModel: bookModel,
          ),
        ),
      ),
    );
  }
}
