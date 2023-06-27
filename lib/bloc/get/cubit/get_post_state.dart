part of 'get_post_cubit.dart';

abstract class GetPostState extends Equatable {
  const GetPostState();

  @override
  List<Object> get props => [];
}

class GetPostInitial extends GetPostState {}

class GetPostComplete extends GetPostState {
  //if complete, there will return List
  final List<Post> posts;

  const GetPostComplete(this.posts);

  //To compare
  @override
  List<Object> get props => [posts];
}

class GetPostFailure extends GetPostState {
  final String error;

  const GetPostFailure(this.error);
  @override
  List<Object> get props => [error];
}
