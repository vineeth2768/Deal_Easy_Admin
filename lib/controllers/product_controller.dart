import 'package:deal_easy_admin/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  var newProduct = {}.obs;

  get price => newProduct['Price'];
  get quantity => newProduct["Quantity"];
  get isRecommended => newProduct["Recommended"];
  get isPopular => newProduct["Popular"];
  get isTopRated => newProduct["TopRated"];

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }
}
