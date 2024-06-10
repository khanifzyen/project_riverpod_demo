import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../repositories/product/provider/product_repository_provider.dart';

part 'product_provider.g.dart';

@riverpod
FutureOr<Map<String, dynamic>> fetchAllProducts(FetchAllProductsRef ref) async {
  return await ref.watch(productRepositoryProvider).fetchAllProducts();
}
