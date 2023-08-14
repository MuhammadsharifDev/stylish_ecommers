import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child:ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                state.products[index].image,
              ),
              StyleText.items(text: state.products[index].text, size: 12, fontWeight: FontWeight.w500,color: Colors.black),
              StyleText.items(text: state.products[index].description, size: 10, fontWeight: FontWeight.w400,color: Colors.black),
              Text(state.products[index].newCoast),
              Row(
                children: [
                  Text(state.products[index].oldCoast,style: const TextStyle(color: Colors.grey),),
                  const SizedBox(width: 15,),
                  StyleText.items(text: state.products[index].offer, size: 20, fontWeight: FontWeight.w500,color: Colors.red),

                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    context.read<HomeBloc>().add(IsLikeEvent(isLike:!state.isLike));
                  }, icon:  Icon(state.isLike?Icons.star:Icons.star_border,color: state.isLike?Colors.deepOrangeAccent.withOpacity(0.7):Colors.grey,)),
                  IconButton(onPressed: (){
                    context.read<HomeBloc>().add(IsLikeEvent(isLike:!state.isLike));
                  }, icon:  Icon(state.isLike?Icons.star:Icons.star_border,color: state.isLike?Colors.deepOrangeAccent.withOpacity(0.7):Colors.grey,)),
                ],
              )
            ],
          ),
        ),
        itemCount: state.products.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
      ) ,
    );
  },
);
  }
}
