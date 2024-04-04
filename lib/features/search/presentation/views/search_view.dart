import 'package:bookly_app/features/search/data/repos/search_repo_imple.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBookCubit(SearchRepoImplement()),
      child:const SafeArea(
        child: Scaffold(
          body: SearchViewBody(),
        ),
      ),
    );
  }
}
