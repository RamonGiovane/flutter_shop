import 'package:flutter/material.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/views/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  
  // const ProductGrid({
  //   Key key,
  //   @required this.loadedProducts,
  // }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    final loadedProducts = Provider.of<Products>(context).items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //define o numero de itens da linha da grid
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: ProductItem(),
      ),
      itemCount: loadedProducts.length,
    );
  }
}
