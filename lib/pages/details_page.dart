import 'package:flutter/material.dart';
import 'package:market_app_ui_lesson_5/pages/home_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const String id = "details_page";

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Your Favorite cars", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView.builder(
      itemCount: details.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(details[index].image),
                  fit: BoxFit.cover,
                )),
            height: 240,
            child: Container(
              padding:
              const EdgeInsets.only(left: 20, bottom: 20, right: 10, top: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.1),
                    ],
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            details[index].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            details[index].type,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      // MaterialButton(
                      //   minWidth: 35,
                      //   height: 35,
                      //   onPressed: () {
                      //     setState(() {
                      //       details[index].isLike = !details[index].isLike;
                      //       if (_selectedProducts[index].isLike) {
                      //         details.add(_selectedProducts[_selectedIndex]);
                      //         counter++;
                      //       } else {
                      //         details.remove(_selectedProducts[_selectedIndex]);
                      //         counter--;
                      //       }
                      //     });
                      //   },
                      //   child: Icon(_selectedProducts[index].isLike
                      //       ? Icons.favorite_outlined
                      //       : Icons.favorite_outline),
                      //   shape: const CircleBorder(),
                      //   color: CupertinoColors.white,
                      // ),
                    ],
                  ),
                  Text(
                    "${details[index].cost.toString()}\$",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        );
    },
      ));
  }
}
