part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}
abstract class  PostActionState extends PostsState{}
final class PostsInitial extends PostsState {}
class postFetchingLodingState extends PostsState{}

class postFetchingerrorState extends PostsState{}

class PostFetchScuess extends PostsState {
  final List<PostDataModel> posts;

  PostFetchScuess({required this.posts});
}
