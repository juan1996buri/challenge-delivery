import 'package:flutter/material.dart';
import 'package:project_delivery_animation/data/grocery_product.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.product, required this.ontap});
  final GroceryProduct product;
  final ValueChanged<GroceryProduct> ontap;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  String list = '';
  void selectedProduct() {
    setState(() {
      list = 'add';
    });
    Navigator.of(context).pop();
    widget.ontap(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: '${widget.product.name}_detail$list',
                    child: Image.asset(
                      widget.product.image,
                      width: double.infinity,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.weight,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '\$ ${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite))),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: selectedProduct,
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
                      child: Text('Add to cart'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
