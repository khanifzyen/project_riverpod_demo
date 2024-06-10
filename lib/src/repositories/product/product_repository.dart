import '../../services/product/product_service.dart';

class ProductRepository {
  final ProductService productService;
  ProductRepository(this.productService);

  Future<Map<String, dynamic>> fetchAllProducts() async {
    try {
      return await productService.fetchAllProducts();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
