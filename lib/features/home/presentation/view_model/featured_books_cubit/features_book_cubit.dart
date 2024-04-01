import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'features_book_state.dart';

class FeaturesBookCubit extends Cubit<FeaturesBookState> {
  FeaturesBookCubit(this.homeRepo) : super(FeaturesBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturesBookLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold((l) {
      emit(FeaturesBookFailure(l.errMessage));
    }, (r) {
      emit(FeaturesBookSuccess(r));
    });
  }
}
