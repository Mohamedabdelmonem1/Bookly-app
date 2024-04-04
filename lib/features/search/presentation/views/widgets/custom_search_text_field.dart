import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        onFieldSubmitted: (value) async {
          BlocProvider.of<SearchBookCubit>(context)
              .fetchFeaturedBooks(searchName: value);
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.white)),
            label: Text("Search",
                style: Styles.textStyle18.copyWith(color: Colors.white)),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
