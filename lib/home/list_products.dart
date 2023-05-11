import 'package:flutter/material.dart';
import 'package:project_delivery_animation/data/grocery_product.dart';
import 'package:project_delivery_animation/home/detail_product/detail_product.dart';

import 'home_cart.dart';
import 'home_inherited.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = HomeInherited.of(context).bloc;
    return Padding(
      padding: EdgeInsets.only(top: backHeight + kToolbarHeight),
      child: Products(
        mainAxisExtent: 250,
        itemBuilder: (context, index) {
          final product = bloc.products[index];
          return ItemProduct(product: product);
        },
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.product});
  final GroceryProduct product;

  @override
  Widget build(BuildContext context) {
    final bloc = HomeInherited.of(context).bloc;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: DetailProduct(
                  product: product,
                  ontap: (GroceryProduct product) {
                    bloc.addToCart(product);
                  },
                ),
              );
            },
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: '${product.name}_detail',
                    child: Image.asset(
                      product.image,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    product.description,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(product.weight),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$ ${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.itemBuilder,
    this.aspectRatio = 3 / 1,
    this.mainAxisExtent = 200,
    this.displacement = 80,
    this.spacing = 5,
  });
  final IndexedWidgetBuilder itemBuilder;
  final double aspectRatio;
  final double mainAxisExtent;
  final double displacement;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraint) {
        final width = contraint.maxWidth;
        final height = contraint.maxHeight;
        final totalHeight = height + displacement * 2;
        return OverflowBox(
          maxHeight: totalHeight,
          minHeight: totalHeight,
          maxWidth: width,
          minWidth: width,
          child: GridView.builder(
            itemCount: 10,
            padding:
                EdgeInsets.only(top: displacement, bottom: displacement * 2),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: aspectRatio,
              mainAxisExtent: mainAxisExtent,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
            itemBuilder: (context, index) {
              return Transform.translate(
                  offset: Offset(0, index.isOdd ? displacement : 0),
                  child: itemBuilder(context, index));
            },
          ),
        );
      },
    );
  }
}
