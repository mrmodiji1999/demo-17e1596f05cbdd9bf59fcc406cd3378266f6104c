import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo/feture/models/post_data_ui_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(postFetchingLodingState());
    var client = http.Client();
    List<PostDataModel> posts = [];
    try {
      var response = await client.get(Uri.parse('https://dummyjson.com/carts'));
      var responseData = jsonDecode(response.body);

      if (responseData is List) {
        List<PostDataModel> posts = [];
        for (var item in responseData) {
          PostDataModel post = PostDataModel.fromMap(item);
          posts.add(post);
        }
        emit(PostFetchScuess(posts: posts));
      } else if (responseData is Map<String, dynamic>) {
        PostDataModel post = PostDataModel.fromMap(responseData);
        posts.add(post);

        emit(PostFetchScuess(posts: [post]));
      } else {
        // Handle other unexpected formats
        emit(postFetchingerrorState());
        print("Unexpected response format: $responseData");
      }
    } catch (e) {
      emit(postFetchingerrorState());
      print(e.toString());
    }
  }
}
