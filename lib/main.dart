import 'package:flutter/material.dart';

void main() {
  runApp(myRootWidget);
}

MaterialApp myRootWidget = const MaterialApp(
  home: MyHome(),
);

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: const HomeContainer(),
    );
  }
}

AppBar myAppBar = AppBar(
  elevation: 8,
  title: const Text(
    "My First App",
    style: TextStyle(
      fontFamily: 'Siliguri',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: Colors.green[600],
);

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      color: Colors.lightBlue[20],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: getHomeContainers(context),
      ),
    );
  }
}

List<Widget> getHomeContainers(BuildContext context) {
  List<Widget> widgets = [];
  widgets.add(
    MaterialButton(
      color: Colors.lightGreen[200],
      onPressed: () {
        showToast('Buttom clicked', context);
      },
      child: Text(
        'Click',
        style: defaultTextStyle,
      ),
    ),
  );
  widgets.add(
    Expanded(
      child: Image.network(
        'https://assets.fireside.fm/file/fireside-images/podcasts/images/b/bc7f1faf-8aad-4135-bb12-83a8af679756/cover.jpg',
      ),
    ),
  );
  widgets.add(
    Expanded(
      child: Image.asset(
        'assets/nodejs-icon.png',
      ),
    ),
  );
  widgets.add(
    Expanded(
      flex: 2,
      child: Column(
        children: getListOfText(),
      ),
    ),
  );
  return widgets;
}

List<Image> getNWImage() {
  List<Image> images = [];
  List<String> urls = [
    'https://assets.fireside.fm/file/fireside-images/podcasts/images/b/bc7f1faf-8aad-4135-bb12-83a8af679756/cover.jpg',
  ];
  for (var o in urls) {
    images.add(
      Image(
        image: NetworkImage(
          o,
        ),
      ),
    );
  }
  return images;
}

List<Text> getListOfText() {
  List<Text> texts = [];
  for (int i = 0; i < 10; i++) {
    Text text = Text(
      "Line number $i",
      style: defaultTextStyle,
    );
    texts.add(text);
  }
  return texts;
}

TextStyle defaultTextStyle = const TextStyle(
  fontFamily: 'Siliguri',
  fontSize: 16.0,
);

void showToast(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
