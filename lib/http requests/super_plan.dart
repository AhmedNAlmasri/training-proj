import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import './http_request.dart';

//////////////////////

class SuperPlan extends StatefulWidget {
  static const routeName = '/super_plan';

  @override
  State<SuperPlan> createState() => _SuperPlanState();
}

class _SuperPlanState extends State<SuperPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              setState(() {
                deleteRow();
              });
            },
          )
        ],
        title: Text('SuperPlan'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchJson(
          http.Client(),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            child: Text('insert'),
            onPressed: () {
              insertRow(7, 'olaola', 'https://via.placeholder.com/150/70f7e3');
              print('insert button pressed');
            },
          ),
          FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.infinity),
            onPressed: () {
              setState(() {
                updateRow(
                  'zendaya',
                  1,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  PhotosList({Key key, @required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            index < photos.length
                ? Text(photos[index].title)
                : Text(photos[index - photos.length].title),
            InkWell(
              child: Image.network(
                photos[index].thumbnailUrl,
              ),
              onTap: () {},
            ),
            index < photos.length
                ? Text(
                    photos[index].id.toString(),
                  )
                : Text(
                    photos[index - photos.length].id.toString(),
                  ),
          ],
        );
      },
    );
  }
}
