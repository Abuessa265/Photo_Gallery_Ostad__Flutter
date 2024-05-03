import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallary/data/card_data.dart';
import 'package:flutter_gallary/screens/selected_album.dart';
import 'package:flutter_gallary/screens/widgets/appbar_back_icon.dart';
import 'package:flutter_gallary/screens/widgets/appbar_title.dart';
import 'package:flutter_gallary/screens/widgets/image_container.dart';
import 'package:flutter_gallary/screens/widgets/pop_menu.dart';

late int itemCount;
late List<Map<String, String>> cards;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    cards = CardData.cards;
    itemCount = cards.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                SystemNavigator.pop();
              },
              child: backIcon(),
            ),
          ),
          title: appbarTitle("Photo Gallery"),
          centerTitle: true,
          actions: [
            popMenu(),
          ],
          backgroundColor: const Color(0xFF2CAB00),
        ),
        body: SafeArea(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return gridViewBuilder(orientation);
            },
          ),
        ));
  }

  Widget gridViewBuilder(Orientation orientation) {
    return GridView.builder(
        padding: const EdgeInsets.all(15.00),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait ? 2 : 4),
          mainAxisSpacing: 20,
          crossAxisSpacing: 25,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedAlbum(index: index)));
            },
            child: imageContainer(cards, index),
          );
        });
  }
}
