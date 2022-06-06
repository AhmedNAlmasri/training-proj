// /*import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../http requests/http_request.dart';
//
// class HelpScreen extends StatefulWidget {
//   static const routeName = '/help_screen';
//   @override
//   _HelpScreenState createState() => _HelpScreenState();
// }
//
// class _HelpScreenState extends State<HelpScreen> {
//   int currentPage = 1;
//   List<Photo> nameList = [];
//   List<Photo> filteredList = [];
//   //ConfigFile confObj = new ConfigFile();
//   Future<List<Photo>> getHelpData() async {
//     return fetchJson(
//     http.Client(),
//     );
// //    return [
//     // {
//     //   'emp_code': '12212',
//     //   'first_name': 'Ahmed',
//     //   'last_name': 'Masri',
//     //   'photo': 'photo_url'
//     // },
//     //
//
//     // {
//     //   'emp_code': '12214',
//     //   'first_name': 'John',
//     //   'last_name': 'Cena',
//     //   'photo': 'photo_url'
//     // },
//     // {
//     //   'emp_code': '12215',
//     //   'first_name': 'mahdi',
//     //   'last_name': 'Smith',
//     //   'photo': 'photo_url'
//     // },
//   }
//
//   final TextEditingController _controller = TextEditingController();
//   ValueNotifier<String> employeeName = ValueNotifier('');
//
//   void changed(String query) {
//     filteredList = nameList
//         .where(
//           (e) =>
//               e.id.toString().contains(query.toLowerCase()) ||
//               e.title.toString().toLowerCase().contains(query.toLowerCase()) ||
//               e.thumbnailUrl.toString().toLowerCase().contains(
//                     query.toLowerCase(),
//                   ),
//         )
//         .toList();
//     employeeName.value = query;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Help List"),
//       ),
//       body: Column(
//         children: <Widget>[
//           SizedBox(height: 15),
//           TextField(
//             controller: _controller,
//             onChanged: changed,
//             decoration: InputDecoration(
//               labelText: "Search",
//               hintText: "Search for someone",
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.elliptical(20, 20),
//                 ),
//               ),
//             ),
//           ),
//           FutureBuilder<List<Photo>>(
//               future: getHelpData(),
//               builder: (ctx, searchContent) {
//                 if (searchContent.hasData) {
//                   nameList = searchContent.data; //todo: this needs fixing
//                   return Expanded(
//                     child: ValueListenableBuilder<String>(
//                         valueListenable: employeeName,
//                         builder: (context, value, child) {
//                           var listViewList =
//                               value.isEmpty ? nameList : filteredList;
//
//                           return ListView.builder(
//                               itemCount: listViewList.length,
//                               itemBuilder: (ctx, i) {
//                                 return ListTile(
//                                   onTap: () {
//                                     // do whatever you want here
//                                   },
//                                   subtitle:
//                                       Text("${listViewList[i].thumbnailUrl}"),
//                                   title: Text(listViewList[i].title),
//                                   trailing: Text(
//                                       'ID:' + listViewList[i].id.toString()),
//                                 );
//                               });
//                         }),
//                   );
//                 } else {
//                   return Center(
//                     child: Text("Loading..."),
//                   );
//                 }
//               })
//         ],
//       ),
//     );
//   }
// }
//
// class PhotosList extends StatelessWidget {
//   PhotosList({@required this.photos});
//
//   final List<Photo> photos;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemCount: photos.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             index < photos.length
//                 ? Text(photos[index].title)
//                 : Text(photos[index - photos.length].title),
//             InkWell(
//               child: Image.network(
//                 photos[index].thumbnailUrl,
//               ),
//               onTap: () {},
//             ),
//             index < photos.length
//                 ? Text(
//                     photos[index].id.toString(),
//                   )
//                 : Text(
//                     photos[index - photos.length].id.toString(),
//                   ),
//           ],
//         );
//       },
//     );
//   }
// } */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../http requests/http_request.dart';

class HelpScreen extends StatefulWidget {
  static const routeName = '/help_screen';

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Photo> nameList = [];
  List<Photo> filteredList = [];
  Future<List<Photo>> getHelpData() async {
    return fetchJson(
      http.Client(),
    );
  }

  final TextEditingController _controller = TextEditingController();

  ValueNotifier<String> employeeName = ValueNotifier(''); //study this

  void changed(String query) {
    filteredList = nameList
        .where(
          (e) =>
              e.id.toString().contains(query.toLowerCase()) ||
              e.title.toString().toLowerCase().contains(query.toLowerCase()) ||
              e.thumbnailUrl.toString().toLowerCase().contains(
                    query.toLowerCase(),
                  ),
        )
        .toList();
    employeeName.value = query;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () async {
          setState(() {});
          print('floating button pressed');
        },
      ),
      appBar: AppBar(
        title: Text("Employees List"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.flutter_dash,
            ),
            onPressed: () {
              showSearch(
                context: context,
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          TextField(
            controller: _controller,
            // onChanged: changed,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  setState(() {});
                },
              ),
              prefixIcon: InkWell(
                child: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () async {
                  print('smthin is happeninig');
                  setState(() {});
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(20, 20),
                ),
              ),
            ),
          ), //end of textfield
          FutureBuilder<List<Photo>>(
            future: _controller.text.isEmpty || _controller.text == ''
                ? fetchJson(http.Client())
                : filterSearch(_controller.text, http.Client()),
            builder: (ctx, searchContent) {
              if (searchContent.hasData &&
                  searchContent.connectionState == ConnectionState.done) {
                nameList = searchContent.data;
                return Expanded(
                  child: ValueListenableBuilder<String>(
                      valueListenable: employeeName,
                      builder: (context, value, child) {
                        return ListView.builder(
                            itemCount: nameList.length,
                            itemBuilder: (ctx, i) {
                              return ListTile(
                                onTap: () {
                                  // do whatever you want here
                                },
                                subtitle: Text("${nameList[i].thumbnailUrl}"),
                                title: Text(nameList[i].title),
                                trailing:
                                    Text('ID:' + nameList[i].id.toString()),
                              );
                            });
                      }),
                );
              } else {
                return SizedBox(
                  height: 500,
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

// class PhotosList extends StatelessWidget {
