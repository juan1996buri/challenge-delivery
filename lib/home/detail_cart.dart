import 'package:flutter/material.dart';
import 'package:project_delivery_animation/home/home_bloc.dart';

import 'home_inherited.dart';

class DetailCart extends StatelessWidget {
  const DetailCart({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = HomeInherited.of(context).bloc;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: AnimatedOpacity(
                    duration: kThemeAnimationDuration,
                    opacity:
                        bloc.currentStateGrocery == GroceryState.cart ? 0 : 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        itemCount: bloc.cartProducts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final item = bloc.cartProducts[index];
                          return Hero(
                            tag: '${item.product.name}_detailadd',
                            child: Stack(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage(item.product.image),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10,
                                    child: Text(
                                      item.amount.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: kThemeAnimationDuration,
                  opacity:
                      bloc.currentStateGrocery == GroceryState.cart ? 0 : 1,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.yellow.shade600,
                    child: Text(
                      bloc.totalProductSelected().toString(),
                      style: const TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              duration: kThemeAnimationDuration,
              opacity: bloc.currentStateGrocery == GroceryState.cart ? 1 : 0,
              child: const DetailPriceProduct(),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPriceProduct extends StatelessWidget {
  const DetailPriceProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = HomeInherited.of(context).bloc;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: bloc.cartProducts.length,
            itemBuilder: (context, index) {
              final item = bloc.cartProducts[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(item.product.image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.amount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'X',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.product.price.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ ${(item.product.price * item.amount).toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          bloc.removeProductToCart(item.product);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ))
                  ],
                ),
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  bloc.priceTotalCart().toStringAsFixed(2),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.yellow.shade600),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.black)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('checkout'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
