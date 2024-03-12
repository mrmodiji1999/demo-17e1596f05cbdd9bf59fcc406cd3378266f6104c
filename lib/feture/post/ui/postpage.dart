import 'package:demo/feture/post/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class postPage extends StatefulWidget {
  const postPage({super.key});

  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  final PostsBloc postsBloc = PostsBloc();
  @override
  void initState() {
    postsBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case postFetchingLodingState:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case PostFetchScuess:
              final successState = state as PostFetchScuess;

              return Container(
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                          '${successState.posts[index].carts.length} ${successState.posts[index].carts[index].userId} ${successState.posts[index].carts[index].products[index].title}'),

                      // title: Text(successState.posts[index].total.toString()),
                    );

                    // Container(

                    //   padding: EdgeInsets.all(16),
                    //   color: Colors.black26,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [Text(successState.posts[index].title)],
                    //   ),
                    // );
                  },
                ),
              );

              break;
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
