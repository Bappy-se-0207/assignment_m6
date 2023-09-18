import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to My Photo Gallery!',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'search for photos...',
              ),
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You clicked image $index'),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text('Image $index'),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://placekitten.com/50/50'),
              ),
              title: Text('Photo 1'),
              subtitle: Text('Description for Photo 1'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://placekitten.com/50/51'),
              ),
              title: Text('Photo 2'),
              subtitle: Text('Description for Photo 2'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://placekitten.com/50/52'),
              ),
              title: Text('Photo 3'),
              subtitle: Text('Description for Photo 3'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: Text('Upload Photos'),
            ),
          ],
        ),
      ),
    );
  }
}
