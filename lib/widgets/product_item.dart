import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final Product product = Provider.of<Product>(context, listen: false);

    final Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      //faz uma borda arredondada no tile
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover, //ocupa todo o tamanho do componente
          ),
        ),

        //Barra de informações
        footer: GridTileBar(
          backgroundColor: Colors.black87,

          //Botão de favorito
          /*Ao invés de escutar toda a classe, marca-se o listen como false (linha 9) e com Consumer<>,
          * escuta apenas um pedaço do códgio */
          leading: Consumer<Product>(
            builder: (ctx, p, _) => IconButton(
              icon: Icon(p.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                p.toggleFavorite();
              },
            ),
          ),

          //Nome do produto
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),

          //Botão de carrinho
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product);
            },
          ),
        ),
      ),
    );
  }
}
