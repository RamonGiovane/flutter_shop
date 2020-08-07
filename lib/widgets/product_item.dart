import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover, //ocupa todo o tamanho do componente
      ),

      //Barra de informações
      footer: GridTileBar(
        backgroundColor: Colors.black87,
       
        //Botão de favorito
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),

        //Nome do produto
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),

        //Botão de carrinho
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ), 


      ),
    );
  }
}
