// lib/screens/cast_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/show_provider.dart';

class CastScreen extends StatelessWidget {
  final int showId;

  CastScreen({required this.showId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(title: Text('Casting',style:TextStyle(color: Colors.white) ,),elevation: 0,backgroundColor: Colors.black45,),
      body: FutureBuilder(
        future: Provider.of<ShowProvider>(context, listen: false).fetchCastByShow(showId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Consumer<ShowProvider>(
            builder: (context, showProvider, child) {
              return ListView.builder(
                itemCount: showProvider.cast.length,
                itemBuilder: (context, index) {
                  final cast = showProvider.cast[index];
                  return Card(
                    color: Colors.white12,
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(

                      leading: cast.image.isNotEmpty
                          ? Image.network(cast.image, fit: BoxFit.cover)
                          : null,
                      title: Text(cast.name,style: TextStyle(color: Colors.white),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (cast.gender != null)
                            Text('Gender: ${cast.gender}',style: TextStyle(color: Colors.white70),),
                          if (cast.birthday != null)
                            Text('Birthday: ${cast.birthday}',style: TextStyle(color: Colors.white70)),
                          if (cast.deathday != null)
                            Text('Deathday: ${cast.deathday}',style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
