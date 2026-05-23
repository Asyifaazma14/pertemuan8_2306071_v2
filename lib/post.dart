import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/post_provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    final posts = provider.posts;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Postingan",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Builder(
        builder: (context) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text('Error: ${provider.error}'));
          }
          if (posts.isEmpty) {
            return Center(child: Text('Tidak ada postingan.'));
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  leading: CircleAvatar(child: Text(post.id.toString())),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Icon(Icons.home),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/photos');
            },
            child: Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}
