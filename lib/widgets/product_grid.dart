import 'package:flutter/material.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/views/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavoriteOnly;

  ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<Products>(context);
    final products = showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //define o numero de itens da linha da grid
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
