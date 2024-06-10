import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_riverpod_demo/src/presentation/product/provider/product_provider.dart';

import '../../data/product_model.dart';

class ProductScreen extends ConsumerWidget {
  ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(fetchAllProductsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.search,
                    size: 20,
                  )
                ],
              ),
              Expanded(
                child: products.when(
                  data: (data) => ListView.builder(
                    itemCount: data["products"].length,
                    itemBuilder: (context, index) {
                      final product = data["products"][index] as ProductModel;
                      return ListTile(
                        title: Text(
                          product.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 3),
                            Chip(
                              label: Text(
                                "\$ ${product.price.toString()}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              labelPadding: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 1,
                              ),
                              side: BorderSide.none,
                              color: const WidgetStatePropertyAll(Colors.blue),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  error: (e, st) => Center(
                    child: Text("Error: $e $st"),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
