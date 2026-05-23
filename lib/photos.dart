import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/photo_provider.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotoProvider>(context);
    final photos = provider.photos;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Foto",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        automaticallyImplyLeading: false,
      ),
      body: Builder(
        builder: (context) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text('Error: ${provider.error}'));
          }
          if (photos.isEmpty) {
            return Center(child: Text('Tidak ada foto.'));
          }
          return ListView.builder(
            itemCount: photos.length.clamp(0, 10),
            itemBuilder: (context, index) {
              final photo = photos[index];
              final imageUrl = index == 1
                  ? 'https://picsum.photos/seed/pink-second/600/400'
                  : photo.url;

              return Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(photo.author),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(imageUrl),
                    ),
                  ),
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
