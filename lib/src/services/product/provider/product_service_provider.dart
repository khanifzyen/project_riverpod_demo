import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../product_service.dart';

part 'product_service_provider.g.dart';

@riverpod
ProductService productService(ProductServiceRef ref) => ProductService();
