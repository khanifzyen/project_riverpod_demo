import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../services/product/provider/product_service_provider.dart';
import '../product_repository.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) =>
    ProductRepository(ref.watch(productServiceProvider));
