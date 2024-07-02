import 'package:e_commerce_app/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fovrito",
        ),
      ),
      body: Column(
        children: [
          Consumer<ApiController>(builder: (context, pro, _) {
            return Expanded(
              child: ListView.builder(
                  itemCount: pro.favorite.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5, 5),
                              color: Colors.grey,
                              blurRadius: 30.0,
                              spreadRadius: 10,
                              // spreadRadius: BorderSide.strokeAlignOutsides,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 200,
                                  width: 200,
                                  child: Image(
                                    image: NetworkImage(
                                        pro.favorite[index].thumbnail),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(pro.favorite[index].brand),
                                        Text(pro.favorite[index].price
                                            .toString()),
                                      ],
                                    ),
                                    Text(pro.favorite[index].stock.toString()),
                                    Text(pro.favorite[index].rating.toString()),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          })
        ],
      ),
    );
  }
}
