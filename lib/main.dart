import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(Movies());
}

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'Movies',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _genre = <String>[
    'all',
    'comedy',
    'horror',
    'action',
    'romance',
    'mystery',
    'crime',
    'animation',
    'fantasy',
    'thriller',
  ];
  String _selectedGenre = 'all';
  int _moviesPerColumns = 2;
  double _currentSliderValue = 0;
  String _selectedQuality = 'all';
  final Map<int, dynamic> _movies = <int, dynamic>{};

  Future<void> getMovies() async {
    final Response response = await get(
        'https://yts.mx/api/v2/list_movies.json?page=1&genre=$_selectedGenre&minimum_rating=$_currentSliderValue&quality=$_selectedQuality');

    final dynamic decodedResponse = jsonDecode(response.body);
    final int movieNumber = int.parse(decodedResponse['data']['movie_count'].toString()) <= 20
        ? int.parse(decodedResponse['data']['movie_count'].toString())
        : 20;
    _movies.clear();
    for (int i = 0; i < movieNumber; i++) {
      _movies[i] = decodedResponse['data']['movies'][i];
    }
    setState(() {
      //Update movies map
    });
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _moviesPerColumns,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.65,
        ),
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    _movies[index]['medium_cover_image'].toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  _movies[index]['title'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(text: 'Year: '),
                      TextSpan(
                          text: _movies[index]['year'].toString() + ' ',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: 'Rating: '),
                      TextSpan(
                          text: _movies[index]['rating'].toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.bottomCenter,
                height: 60.0,
                child: const DrawerHeader(
                  child: Text(
                    'Filter the movies',
                    style: TextStyle(fontSize: 24.0),
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Minimum rating',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 9,
                  divisions: 9,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                    getMovies();
                  },
                )
              ],
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Movies per column: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                FlatButton(
                  minWidth: 8.0,
                  child: Text('$_moviesPerColumns'),
                  onPressed: () {
                    setState(() {
                      _moviesPerColumns++;
                      _moviesPerColumns = _moviesPerColumns % 4;
                      _moviesPerColumns == 0 ? _moviesPerColumns = 1 : _moviesPerColumns = _moviesPerColumns;
                    });
                  },
                )
              ],
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 0.0),
                  child: Text(
                    'Genre: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                DropdownButton<String>(
                  hint: const Text('No genre selected'),
                  value: _selectedGenre,
                  items: _genre.map((String parameter) {
                    // ignore: always_specify_types
                    return DropdownMenuItem(
                      child: Text(parameter),
                      value: parameter,
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(
                      () {
                        _selectedGenre = newValue;
                      },
                    );
                    getMovies();
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Quality: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                ListTile(
                  title: const Text('All'),
                  leading: Radio<String>(
                    value: 'all',
                    groupValue: _selectedQuality,
                    onChanged: (String value) {
                      setState(() {
                        _selectedQuality = value;
                      });
                      getMovies();
                    },
                  ),
                ),
                ListTile(
                  title: const Text('720p'),
                  leading: Radio<String>(
                    value: '720p',
                    groupValue: _selectedQuality,
                    onChanged: (String value) {
                      setState(() {
                        _selectedQuality = value;
                      });
                      getMovies();
                    },
                  ),
                ),
                ListTile(
                  title: const Text('1080p'),
                  leading: Radio<String>(
                    value: '1080p',
                    groupValue: _selectedQuality,
                    onChanged: (String value) {
                      setState(() {
                        _selectedQuality = value;
                      });
                      getMovies();
                    },
                  ),
                ),
                ListTile(
                  title: const Text('2160p'),
                  leading: Radio<String>(
                    value: '2160p',
                    groupValue: _selectedQuality,
                    onChanged: (String value) {
                      setState(() {
                        _selectedQuality = value;
                      });
                      getMovies();
                    },
                  ),
                ),
                ListTile(
                  title: const Text('3D'),
                  leading: Radio<String>(
                    value: '3D',
                    groupValue: _selectedQuality,
                    onChanged: (String value) {
                      setState(() {
                        _selectedQuality = value;
                      });
                      getMovies();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
