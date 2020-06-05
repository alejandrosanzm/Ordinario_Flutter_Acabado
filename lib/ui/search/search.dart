import 'package:examen_extraordinario/data/model/locations/locationContainer.dart';
import 'package:examen_extraordinario/data/remote/remote.dart';
import 'package:examen_extraordinario/ui/predictions/predictions.dart';
import 'package:examen_extraordinario/ui/search/searchPresenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchState extends State<Search> {
  var _searchText;
  var presenter;
  var flag = false;

  @override
  Widget build(BuildContext context) {
    if (!flag) {
      presenter = SearchPresenter(this);
      flag = true;
      _searchText = "Search";
    }

    return Scaffold(
      appBar: myAppBar(),
      body: Center(
        child: _mBuilder(),
      ),
    );
  }

  Widget myAppBar() {
    return AppBar(
      title: Text("Buscar"),
    );
  }

  // Cargamos la busqueda
  FutureBuilder<LocationContainer> _mBuilder() {
    return FutureBuilder<LocationContainer>(
      future: Remote().fetchPost(_searchText),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (_, __) => Divider(
              height: 15.0,
              color: Colors.black,
            ),
            itemCount: snapshot.data.locations.length + 1,
            itemBuilder: (BuildContext ctxt, int index) {
              return _tile(snapshot, index);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  // Cargamos las tiles que montará el future
  Widget _tile(snapshot, index) {
    if (index == 0) {
      return ListTile(
        title: TextFormField(
          initialValue: _searchText,
          onChanged: (val) {
            setState(() {
              if (val == "") {
                _searchText = " ";
              } else {
                _searchText = val;
              }
            });
          },
        ),
      );
    }

    String _myTitle = snapshot.data.locations[index - 1].title;

    return ListTile(
      title: Text(
        _myTitle,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle:
          Text("ID: " + snapshot.data.locations[index - 1].woeid.toString()),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PredictionsList(
                    snapshot.data.locations[index - 1].woeid.toString(),
                    _myTitle,
                  )),
        );
      },
    );
  }
}

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}
