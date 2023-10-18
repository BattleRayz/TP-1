import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showImage = false;
  String imageIndex = "0";

  void toggleImage() {
    setState(() {
      showImage = !showImage;
    });
  }

  void updateImageIndex(String newIndex) {
    setState(() {
      imageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chiffres & Images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showImage ? ImageContainer(imageIndex: imageIndex) : Text(imageIndex),
            
            ElevatedButton(
              onPressed: toggleImage,
              child: Text(showImage ? 'Afficher le texte' : 'Afficher l\'image'),
            ),
            
            KeyboardComponent(sendValueToMain: updateImageIndex),
          ],
        ),
      ),
    );
  }
}

class KeyboardComponent extends StatefulWidget {
  final Function(String) sendValueToMain;

  KeyboardComponent({Key key, required this.sendValueToMain}) : super(key: key);

  @override
  _KeyboardComponentState createState() => _KeyboardComponentState();
}

class _KeyboardComponentState extends State<KeyboardComponent> {
 
  void sendValue(String value) {
    widget.sendValueToMain(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        for (int i = 0; i < 10; i++)
          ElevatedButton(
            onPressed: () {
              sendValue(i.toString());
            },
            child: Text(i.toString()),
          ),
      ],
    );
  }
}

class ImageContainer extends StatefulWidget {
  final String imageIndex;

  ImageContainer({Key key, required this.imageIndex}) : super(key: key);

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
   
    List<String> images = [
      "https://picsum.photos/300/300?random=0",
      "https://picsum.photos/300/300?random=1",
      "https://picsum.photos/300/300?random=2",
      "https://picsum.photos/300/300?random=3",
      "https://picsum.photos/300/300?random=4",
      "https://picsum.photos/300/300?random=5",
      "https://picsum.photos/300/300?random=6",
      "https://picsum.photos/300/300?random=7",
      "https://picsum.photos/300/300?random=8",
      "https://picsum.photos/300/300?random=9",
    
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.purple,
            blurRadius: 4,
            offset: Offset(4, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.network(images[int.parse(widget.imageIndex)]),
      ),
    );
  }
}
