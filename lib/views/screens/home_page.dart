import 'package:e_commerce_app/controllers/api_controller.dart';
import 'package:e_commerce_app/controllers/cart_db_controller.dart';
import 'package:e_commerce_app/controllers/like_controllar.dart';
import 'package:e_commerce_app/modal/api_modal.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color defaultcolor = Colors.white;

    return Scaffold(
      backgroundColor: defaultcolor,
      appBar: AppBar(
        backgroundColor: defaultcolor,
        centerTitle: true,
        title: const Text(
          "Home Page",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                MyRoutes.like,
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                MyRoutes.detail,
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Trending",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              height: 560,
              width: 400,
              child: Consumer<ApiController>(
                builder: (context, pro, _) {
                  if (pro.alldata.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CardSwiper(
                    backCardOffset: Offset(20, 50),
                    numberOfCardsDisplayed: 1,
                    cardBuilder: (context, index, x, y) {
                      final item = pro.alldata[index];

                      return Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            color: Colors.brown.shade400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.brown.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                      ),
                                      child: Consumer<LikeControllar>(
                                        builder: (context, pro, _) {
                                          return IconButton(
                                            onPressed: () {
                                              pro.toggleLike(item);
                                              Provider.of<ApiController>(
                                                context,
                                                listen: false,
                                              ).toggleFavorite(item);
                                            },
                                            icon: Consumer<LikeControllar>(
                                              builder: (context, prod, _) {
                                                bool isLiked = prod.isLiked(
                                                    item); // Pass String ID here
                                                bool isInFavorites =
                                                    Provider.of<ApiController>(
                                                            context,
                                                            listen: false)
                                                        .favorite
                                                        .contains(item);

                                                return Icon(
                                                  isInFavorites
                                                      ? Icons.bookmark
                                                      : Icons.bookmark_border,
                                                  // isLiked
                                                  //     ? Icons.bookmark
                                                  //     : Icons.bookmark,
                                                  color: isInFavorites
                                                      ? Colors.black
                                                      : Colors.white,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 40),
                                        child: Container(
                                          child: Image.network(
                                            item.thumbnail,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Column(
                                            children: [
                                              Text(
                                                item.title,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                item.description,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Consumer<CartController>(
                                        builder: (context, pro, _) {
                                      return IconButton(
                                        onPressed: () {
                                          pro.cartadd(item);
                                          Provider.of<ApiController>(context,
                                                  listen: false)
                                              .Cart(item);
                                          // Navigator.of(context).pushNamed(
                                          //   MyRoutes.detail,
                                          //   arguments: item,
                                          // );
                                        },
                                        icon: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black,
                                          child: Icon(
                                            Icons.shopping_bag_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          MyRoutes.cart,
                                          arguments: item,
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add to Cart",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    cardsCount: pro.alldata.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
