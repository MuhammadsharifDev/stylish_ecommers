import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/home/bloc/home_bloc.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';

class ProductList1Widget extends StatelessWidget {
  const ProductList1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 290,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var product = state.products[index];
              return Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Image.asset(
                        product.image,
                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          child: IconButton(
                              onPressed: () {
                                context.read<HomeBloc>().add(ProductsLikeEvent(
                                    product: product, index: index));
                              },
                              icon: Icon(
                                product.isLike
                                    ? Icons.favorite
                                    : Icons.favorite_border_sharp,
                                color:
                                    product.isLike ? Colors.red : Colors.grey,
                              ))),
                    ]),
                    StyleText.items(
                        text: product.text,
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    StyleText.items(
                        text: product.description,
                        size: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    Text(product.newCoast),
                    Row(
                      children: [
                        Text(
                          product.oldCoast,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        StyleText.items(
                          text: product.offer,
                          size: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context.read<HomeBloc>().add(ChangeStarsEvent(
                                  changeBottom: !state.clickStarBottom));
                            },
                            icon: Icon(
                              state.clickStarBottom
                                  ? Icons.star
                                  : Icons.star_border,
                              color: state.clickStarBottom
                                  ? Colors.deepOrangeAccent.withOpacity(0.7)
                                  : Colors.grey,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<HomeBloc>().add(ChangeStarsEvent(
                                  changeBottom: !state.clickStarBottom));
                            },
                            icon: Icon(
                              state.clickStarBottom
                                  ? Icons.star
                                  : Icons.star_border,
                              color: state.clickStarBottom
                                  ? Colors.deepOrangeAccent.withOpacity(0.7)
                                  : Colors.grey,
                            )),
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: state.products.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 16,
            ),
          ),
        );
      },
    );
  }
}
