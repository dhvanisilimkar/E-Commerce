import 'package:flutter/material.dart';
import '../../modal/api_modal.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Products alldata = ModalRoute.of(context)!.settings.arguments as Products;
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 300,
              width: 450,
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image(
                        image: NetworkImage(alldata.thumbnail),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(alldata.title),
                      Text(alldata.price.toString()),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
