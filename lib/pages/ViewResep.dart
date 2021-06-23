import 'dart:convert';

import 'package:final_project/pages/favorite.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'resep.dart';
import 'package:flutter/services.dart' as RootBundle;

class VResep extends StatefulWidget {
  @override
  _VResepState createState() => _VResepState();
}

class _VResepState extends State<VResep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJsonDatabase(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text('${snapshot.error}'),
            );
          else if (snapshot.hasData) {
            var items = snapshot.data as List<Resep>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              child: Image(
                                image: NetworkImage(items[index].imageUrl),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          items[index].name,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        LikeButton(
                                          circleColor: CircleColor(
                                              start: Color(0xff00ddff),
                                              end: Color(0xff0099cc)),
                                          bubblesColor: BubblesColor(
                                            dotPrimaryColor: Color(0xff33b5e5),
                                            dotSecondaryColor:
                                                Color(0xff0099cc),
                                          ),
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.favorite,
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.grey,
                                            );
                                          },
                                          likeCount: 100,
                                          countBuilder: (int count,
                                              bool isLiked, String text) {
                                            var color = isLiked
                                                ? Colors.red
                                                : Colors.red;
                                            Widget result;
                                            if (count == 0) {
                                              result = Text(
                                                "love",
                                                style: TextStyle(color: color),
                                              );
                                            } else
                                              result = Text(
                                                text,
                                                style: TextStyle(color: color),
                                              );
                                            return result;
                                          },
                                        ),
                                        // LikeButton(),
                                        // FutureBuilder(
                                        //   builder: (context, snapshot) {
                                        //     if (snapshot.hasData)
                                        //       return IconButton(
                                        //           icon: Icon(
                                        //             Icons.favorite,
                                        //             color: Colors.red,
                                        //           ),
                                        //           onPressed: null);
                                        //     else
                                        //       return IconButton(
                                        //           icon: Icon(
                                        //               Icons.favorite_border),
                                        //           onPressed: null);
                                        //   },
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            flex: 6,
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  Future<List<Resep>> readJsonDatabase() async {
    final rawData = await RootBundle.rootBundle
        .loadString('assets/data/my_product_json.json');
    final list = json.decode(rawData) as List<dynamic>;
    return list.map((m) => Resep.fromJson(m)).toList();
  }
}
