import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './src/screens/second_screen.dart';
import './src/screens/thanks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Home';

  Widget build(BuildContext context) {
    return new MaterialApp(title: appTitle, home: MyHomePage(title: appTitle));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: new RandomWords(),
      drawer: new Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('Welcome to '),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage("https://bit.ly/2GBAhLt")),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.green,
                      // offset: Offset(0.0, 0.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Thanks Screen',
                  textScaleFactor: 1.2,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThanksScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  // Add the next two lines.
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  final Set<WordPair> _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (BuildContext _context, int i) {
      if (i.isOdd) {
        return new Divider();
      }

      final int index = i ~/ 2;

      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    bool alreadySaved = _saved.contains(pair);

    return new ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(pair.toString().substring(0, 1).toUpperCase(),
            style: TextStyle(color: Colors.white)),
      ),
      subtitle: Text("My subtitle"),
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing:
          // new Icon(
          //   alreadySaved ? Icons.favorite : Icons.favorite_border,
          //   color: alreadySaved ? Colors.red : null,
          // ),
          new IconButton(
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
              alreadySaved = false;
            } else {
              _saved.add(pair);
              alreadySaved = true;
            }
          });
        },
        icon: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SecondScreen(word: pair.asPascalCase.toString())),
        );
      },
    );
  }
}
