import 'package:flutter/material.dart';
import 'package:project_delivery_animation/home/detail_cart.dart';
import 'package:project_delivery_animation/home/home_inherited.dart';
import 'package:project_delivery_animation/home/list_products.dart';
import 'home_bloc.dart';

class HomeCart extends StatefulWidget {
  const HomeCart({super.key});

  @override
  State<HomeCart> createState() => _HomeCartState();
}

double backHeight = 100.0;

class _HomeCartState extends State<HomeCart> {
  final bloc = HomeBloc();

  void dragUpdateDetailsVertical(DragUpdateDetails details) {
    if (details.primaryDelta! < -4) {
      bloc.changeCart();
    }
    if (details.primaryDelta! > 4) {
      bloc.changeDetail();
    }
  }

  double changeColorWhite(Size size, GroceryState currentStateGrocery) {
    if (currentStateGrocery == GroceryState.detail) {
      return -backHeight;
    } else if (currentStateGrocery == GroceryState.cart) {
      return -size.height + backHeight - kToolbarHeight;
    }
    return 0.0;
  }

  double changeColorBlack(Size size, GroceryState currentStateGrocery) {
    if (currentStateGrocery == GroceryState.detail) {
      return size.height - backHeight;
    } else if (currentStateGrocery == GroceryState.cart) {
      return backHeight - kToolbarHeight;
    }
    return 0.0;
  }

  double changeAppBar(GroceryState currentStateGrocery) {
    if (currentStateGrocery == GroceryState.detail) {
      return 0;
    } else if (currentStateGrocery == GroceryState.cart) {
      return -kToolbarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return HomeInherited(
            bloc: bloc,
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  AnimatedPositioned(
                    duration: kThemeAnimationDuration,
                    top: changeColorWhite(size, bloc.currentStateGrocery),
                    left: 0,
                    right: 0,
                    height: size.height,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: const ListProducts(),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: kThemeAnimationDuration,
                    top: changeColorBlack(size, bloc.currentStateGrocery),
                    left: 0,
                    right: 0,
                    height: size.height - backHeight + kToolbarHeight,
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        dragUpdateDetailsVertical(details);
                      },
                      child: Container(
                        color: Colors.black,
                        child: const DetailCart(),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: kThemeAnimationDuration,
                    top: changeAppBar(bloc.currentStateGrocery),
                    left: 0,
                    right: 0,
                    child: const _ToolbarNavigation(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _ToolbarNavigation extends StatelessWidget {
  const _ToolbarNavigation();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
