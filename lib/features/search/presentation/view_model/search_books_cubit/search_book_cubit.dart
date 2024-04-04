import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchRepo) : super(SearchBookInitial());

  final SearchRepo searchRepo;

  Future<void> fetchFeaturedBooks({required String searchName}) async {
    emit(SearchBookLoading());
    var result = await searchRepo.fetchSearchBooks(searchName: searchName);
    result.fold((l) {
      emit(SearchBookFailure(l.errMessage));
    }, (r) {
      emit(SearchBookSuccess(r));
    });
  }
}
