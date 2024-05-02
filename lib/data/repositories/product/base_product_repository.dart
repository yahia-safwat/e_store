import '../../models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
  Future updateProduct(Product product);
}
