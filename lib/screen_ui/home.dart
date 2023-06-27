import 'package:app_using_bloc/bloc/get/cubit/get_post_cubit.dart';
import 'package:app_using_bloc/data/modal/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetPostCubit>(context).getPost();
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: BlocBuilder<GetPostCubit, GetPostState>(
        builder: (context, state) {
          if (state is GetPostComplete) {
            List<Post> list = state.posts;

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 15,
                          child: Text(list[index].userId.toString())),
                      title: Text(
                        list[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(list[index].body),
                    ),
                  ),
                );
              },
            );
          } else if (state is GetPostFailure) {
            return Center(child: Text(state.error));
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Data Loading...',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
