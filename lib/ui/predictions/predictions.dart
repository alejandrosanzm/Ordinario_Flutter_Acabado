import 'package:examen_extraordinario/data/model/predictionsDetail/predictionContainer.dart';
import 'package:examen_extraordinario/data/remote/predictionRemote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PredictionListState extends State<PredictionsList> {
  String _key = "766273";
  String _title = "Predicción";

  PredictionListState(this._key, this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Center(
        child: _mBuilder(),
      ),
    );
  }

  Widget myAppBar() {
    return AppBar(
      title: Text(_title),
    );
  }

  // Cargamos la busqueda
  FutureBuilder<PredictionContainer> _mBuilder() {
    return FutureBuilder<PredictionContainer>(
      future: PredictionRemote().fetchPost(_key),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (_, __) => Divider(
              height: 15.0,
              color: Colors.black,
            ),
            itemCount: snapshot.data.consolidated_weather.length,
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
    return ListTile(
      title: Text(
        snapshot.data.consolidated_weather[index].applicable_date.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        snapshot.data.consolidated_weather[index].weather_state_name +
            ", " +
            snapshot.data.consolidated_weather[index].the_temp
                .toStringAsFixed(2) +
            "ºC",
      ),
      leading: Image.network(
          "https://www.metaweather.com/static/img/weather/png/" +
              snapshot.data.consolidated_weather[index].weather_state_abbr +
              ".png"),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            snapshot.data.consolidated_weather[index].max_temp
                    .toStringAsFixed(2) +
                "ºC",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            snapshot.data.consolidated_weather[index].min_temp
                    .toStringAsFixed(2) +
                "ºC",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class PredictionsList extends StatefulWidget {
  String myKey = "766273";
  String myTitle = "Predicción";

  PredictionsList(this.myKey, this.myTitle);

  @override
  State<StatefulWidget> createState() {
    return PredictionListState(myKey, myTitle);
  }
}
