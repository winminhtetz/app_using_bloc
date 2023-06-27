import 'package:app_using_bloc/data/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/modal/post.dart';
part 'get_post_state.dart';

class GetPostCubit extends Cubit<GetPostState> {
  final PostRepo _postRepo;

  GetPostCubit(this._postRepo) : super(GetPostInitial());

  void getPost() {
    emit(GetPostInitial());
    _postRepo
        .getPost()
        .then((value) => emit(GetPostComplete(value)))
        .catchError((e) => emit(GetPostFailure('Error $e')));
  }
}
