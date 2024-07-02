// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../modal/api_modal.dart';
//
// class ApiHelper {
//   ApiHelper._();
//
//   static final ApiHelper apiHelper = ApiHelper._();
//
//   List<Products> favorite = [];
//   List<Products> allData = [];
//
//   String api = 'https://dummyjson.com/products?limit=100';
//
//   Future<List> get() async {
//     http.Response response = await http.get(Uri.parse(api));
//     if (response.statusCode == 200) {
//       Map data = jsonDecode(response.body);
//       List alldata = data['products'];
//       allData = alldata
//           .map(
//             (e) => Products.fromdata(
//               data: e,
//             ),
//           )
//           .toList();
//     }
//     return allData;
//   }
//
//   void liked({required int id}) {
//     favorite.add(allData.map((e) => e.id == id) as Products);
//   }
// }
//

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/api_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  List<Products> favorite = [];
  List<Products> cartItems = [];
  List<Products> allData = [];
  // List<Products> allcartdata =
  //     allcartdata.map((e) => e.brand).cast<Products>().toList();
  // List allbrand = (allcartdata.toSet()).toList();

  String api = 'https://dummyjson.com/products?limit=100';

  Future<List<Products>> get() async {
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List alldata = data['products'];
      allData = alldata.map((e) => Products.fromdata(data: e)).toList();
    }
    return allData;
  }

  Future<List<Products>> liked({required int id}) async {
    Products? product = allData.firstWhere(
      (product) => product.id == id,
      orElse: () => Products(
          id: 0,
          title: '',
          description: '',
          price: 0,
          discountPercentage: 0,
          rating: 0,
          stock: 0,
          brand: '',
          category: '',
          thumbnail: ''),
    );

    if (product != Products) {
      // Check if the product is already in the favorite list
      bool isFavorite = favorite.contains(product);

      // If the product is already in the favorite list, remove it
      if (isFavorite) {
        favorite.remove(product);
      } else {
        // If the product is not in the favorite list, add it
        favorite.add(product);
      }
    }

    // Return the updated favorite list
    return favorite;
  }

  List<Products> Cartget({required int id}) {
    Products products = allData.firstWhere(
      (product) => product.id == id,
      orElse: () => Products(
          id: 0,
          title: '',
          description: '',
          price: 0,
          discountPercentage: 0,
          rating: 0,
          stock: 0,
          brand: '',
          category: '',
          thumbnail: ''),
    );

    if (products != Products) {
      bool iscart = cartItems.contains(products);
      if (iscart) {
        cartItems.add(products);
      }
    }
    return cartItems;
  }
}
