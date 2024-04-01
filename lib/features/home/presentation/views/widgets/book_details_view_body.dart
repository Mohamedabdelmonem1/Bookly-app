import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_book_detail_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2),
                  child: CustomListViewItem(
                    imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? "",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Text(
                  bookModel.volumeInfo!.title!,
                  style: Styles.textStyle30,
                   textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 6,
                ),
                Text(
                  bookModel.volumeInfo!.authors?[0] ??"",
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                 BookRating(
                  ratingCount: bookModel.volumeInfo!.ratingsCount ?? 0,
                  averageRating: bookModel.volumeInfo!.averageRating ?? 0,
                ),
                const SizedBox(
                  height: 24,
                ),
                 BookActionButton(
                   bookModel: bookModel,
                 ),
                const Expanded(
                  child: SizedBox(
                    height: 32,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like :",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const FeatureBooksDetailsListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
