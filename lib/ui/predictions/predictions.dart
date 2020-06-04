import 'package:examen_extraordinario/data/model/predictionsDetail/predictionContainer.dart';
import 'package:examen_extraordinario/data/remote/predictionRemote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PredictionListState extends State<PredictionsList> {
  String _key = "766273";

  PredictionListState(this._key);

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
      title: Text("Predicción"),
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
        "Time: " +
            snapshot.data.consolidated_weather[index].weather_state_name
                .toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("Temperature: " +
          snapshot.data.consolidated_weather[index].the_temp.toString()),
      leading: Text(
          snapshot.data.consolidated_weather[index].applicable_date.toString()),
    );
  }
}

class PredictionsList extends StatefulWidget {
  String myKey;

  PredictionsList(this.myKey);

  @override
  State<StatefulWidget> createState() {
    return PredictionListState(myKey);
  }
}
