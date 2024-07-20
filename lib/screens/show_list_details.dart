// lib/screens/show_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/show.dart';
import 'cast_screen.dart';

class ShowDetailScreen extends StatelessWidget {
  final Show show;

  ShowDetailScreen({required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text(
          show.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black45,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(show.image)),
            SizedBox(height: 16.0),
            Text(
              show.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,  color: Colors.yellow),
              ),


            SizedBox(height: 8.0),
            Text(
              'Language: ${show.language}',
              style: TextStyle(fontSize: 16.0,color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Rating: ${show.rating}',
              style: TextStyle(fontSize: 16.0,color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Time: ${show.time}',
              style: TextStyle(fontSize: 16.0,color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              show.description,
              style: TextStyle(fontSize: 14.0,color: Colors.white),
            ),
            SizedBox(
                height: 16.0), // Add spacing between description and button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CastScreen(showId: show.id),
                    ),
                  );
                },
                child: Text('Show Cast'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
