import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return NewestBookListViewItem(
                bookModel: state.books[index],
              );
            },
          );
        } else if (state is SearchBookFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Styles.textStyle18,
            ),
          );
        } else {
          return const Center(
              // child: CircularProgressIndicator(),
              );
        }
      },
    );
  }
}
