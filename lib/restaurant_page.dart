import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newProj/providers/user_info.dart';
import './providers/user_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'categories/categorie_name.dart';

class RestaurantPage extends StatelessWidget {
  // const RestaurantPage({Key? key}) : super(key: key);
  void registerNotification() async {
    // await Firebase.initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    var recipieIndex = Provider.of<UserFood>(context).providerNum;
    return Column(
      children: [
        Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'all'.tr().toString());
                  },
                  child: Text('all'.tr().toString()),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'indian'.tr().toString());
                  },
                  child: Text('indian'.tr().toString()),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'moroccan'.tr().toString());
                  },
                  child: Text('moroccan'.tr().toString()),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'yemen'.tr().toString());
                  },
                  child: Text('yemen'.tr().toString()),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'german'.tr().toString());
                  },
                  child: Text('german'.tr().toString()),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'egyptian'.tr().toString());
                  },
                  child: Text('egyptian'.tr().toString()),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'mexican'.tr().toString());
                  },
                  child: Text('mexican'.tr().toString()),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        CategorieNameScreen.routeName,
                        arguments: 'american'.tr().toString());
                  },
                  child: Text('american'.tr().toString()),
                ),
              ],
            )),
        TextButton.icon(
          icon: Icon(Icons.restart_alt),
          label: Text(Provider.of<UserFood>(context).recipes[recipieIndex]),
          onPressed: () =>
              Provider.of<UserFood>(context, listen: false).resetValue(),
        ),
        Container(
          height: MediaQuery.of(context).size.width <= 450
              ? MediaQuery.of(context).size.height - 268
              : MediaQuery.of(context).size.height - 250,
          child: GridView.count(
            mainAxisSpacing: MediaQuery.of(context).size.width <= 450 ? 20 : 10,
            crossAxisCount: MediaQuery.of(context).size.width <= 450 ? 1 : 2,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: AssetImage('assets/red_food.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'book_cover'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'new_tasty'.tr().toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '95'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        Text(
                          '16'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  color: Color.fromRGBO(38, 38, 38, 1),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: AssetImage('assets/green_food.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'book_cover'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'new_tasty'.tr().toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '95'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        Text(
                          '16'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  color: Color.fromRGBO(31, 29, 29, 1),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: AssetImage('assets/blue_food.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'book_cover'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'new_tasty'.tr().toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '95'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        Text(
                          '16'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  color: Color.fromRGBO(0, 0, 0, 1.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: AssetImage('assets/purple_food.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'book_cover'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'new_tasty'.tr().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '95'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        Text(
                          '16'.tr().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
