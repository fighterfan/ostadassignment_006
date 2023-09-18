import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  // Define a list of image URLs and captions
  final List<String> imageUrls = [
    'https://tinyurl.com/5bhypzbh',
    'https://tinyurl.com/mpvjx5kb',
    'https://tinyurl.com/2vjpw7ba',
    'https://tinyurl.com/2ar4mf8m',
    'https://tinyurl.com/4z8mr45z',
    'https://tinyurl.com/2s3vchya',
  ];

  final List<String> captions = [
    'Image 1',
    'Image 2',
    'Image 3',
    'Image 4',
    'Image 5',
    'Image 6',
  ];

  // Define a list of sample photos with titles and subtitles
  final List<Map<String, String>> samplePhotos = [
    {
      'title': 'Sample Photo 1',
      'subtitle': 'Beautiful landscape',
      'imageUrl': 'https://tinyurl.com/4ntxy463',
    },
    {
      'title': 'Sample Photo 2',
      'subtitle': 'Adorable pets',
      'imageUrl': 'https://tinyurl.com/3pwuzs5c',
    },
    {
      'title': 'Sample Photo 3',
      'subtitle': 'Delicious food',
      'imageUrl': 'https://tinyurl.com/39r5wtya',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Photo Gallery"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                    child: Text(
                      "Wellcome to Gallery",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your text here',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: imageUrls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Show a Snackbar when the image is clicked
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Image $index clicked!'),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(
                          imageUrls[index],
                          width: 110,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(captions[index]),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: samplePhotos.map((photo) {
                  return ListTile(
                    leading: Image.network(
                      photo['imageUrl']!,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(photo['title']!),
                    subtitle: Text(photo['subtitle']!),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Show a Snackbar when the custom button is clicked
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Photos Uploaded Successfully!'),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 24.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
