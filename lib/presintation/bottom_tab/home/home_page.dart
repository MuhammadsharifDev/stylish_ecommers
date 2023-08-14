import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/textfield_items.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_icon.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_images.dart';

import 'bloc/home_bloc.dart';
import 'widgets/productlist1_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            appBar: AppBar(
              backgroundColor: const Color(0xffF9F9F9),
              toolbarHeight: 180,
              leading: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: CircleAvatar(child: Icon(Icons.sort)),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.stylish_icon),
                  Text(
                    'Stylish',
                    style: GoogleFonts.libreCaslonText(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff4392F9)),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(5.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 10),
                    child: TextField(
                      decoration: TextFieldItems.items(
                        prefIcon: Icons.search_rounded,
                        suffIcon: const Icon(Icons.keyboard_voice_outlined),
                        hintex: 'Search..',
                        radius: 6,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: CircleAvatar(child: Image.asset(AppImages.profile)),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    StyleText.items(
                        text: 'All Featured',
                        size: 18,
                        fontWeight: FontWeight.w700),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      width: double.infinity,
                      height: 95,
                      color: Colors.white70,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                state.items[index].image,
                              ),
                              Text(state.items[index].text),
                            ],
                          ),
                        ),
                        itemCount: state.items.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Stack(children: [
                     Container(
                         height: 189,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                         ),
                         child: Image.asset('assets/image_png/Rectangle 48.png',fit: BoxFit.cover,)),
                      Positioned(
                        top: 40,
                        left: 35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyleText.items(
                                text: '50-40% OFF',
                                size: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                            StyleText.items(text: 'Now in (product', size: 12, fontWeight: FontWeight.w400),
                            StyleText.items(text: 'All colours', size: 12, fontWeight: FontWeight.w400),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 32),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: const BorderSide(color: Colors.white),
                                    )
                                ),
                                onPressed: (){}, child: const Center(child: Text('Shop Now ->'))),
                          ],
                        ),
                      ),
                    ]
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    Container(
                      padding: const EdgeInsets.all(10),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff4392F9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StyleText.items(
                                    text: 'Deal Of the Day',
                                    size: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                StyleText.items(text: '22h 55m 20s remaining ', size: 12, fontWeight: FontWeight.w400,color: Colors.white),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 32),
                                    backgroundColor:const Color(0xff4392F9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: const BorderSide(color: Colors.white),
                                    )
                                ),
                                onPressed: (){}, child: const Center(child: Text('View All ->',style: TextStyle(color: Colors.white),))),
                          ],
                        ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    const ProductList1Widget(),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                     SizedBox(
                       height: 171,
                         width: double.infinity,
                         child: Image.asset('assets/image_png/frame.jpg',fit: BoxFit.cover,)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffFD6E87),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyleText.items(
                                  text: 'Trending Products ',
                                  size: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              StyleText.items(text: 'Last Date 29/02/22', size: 12, fontWeight: FontWeight.w400,color: Colors.white),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 32),
                                  backgroundColor:const Color(0xffFD6E87),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: const BorderSide(color: Colors.white),
                                  )
                              ),
                              onPressed: (){}, child: const Center(child: Text('View All ->',style: TextStyle(color: Colors.white),))),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    SizedBox(
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
                                    context.read<HomeBloc>().add(ChangeStarsEvent(changeBottom:!state.clickStarBottom));
                                  }, icon:  Icon(state.clickStarBottom?Icons.star:Icons.star_border,color: state.clickStarBottom?Colors.deepOrangeAccent.withOpacity(0.7):Colors.grey,)),
                                  IconButton(onPressed: (){
                                    context.read<HomeBloc>().add(ChangeStarsEvent(changeBottom:!state.clickStarBottom));
                                  }, icon:  Icon(state.clickStarBottom?Icons.star:Icons.star_border,color: state.clickStarBottom?Colors.deepOrangeAccent.withOpacity(0.7):Colors.grey,)),
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
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       Image.asset('assets/image_png/frame_2.jpg'),
                          StyleText.items(text: 'New Arrivals ', size: 20, fontWeight: FontWeight.w500),
                          Row(
                            children: [
                              StyleText.items(text: 'Summer’ 25 Collections ', size: 16, fontWeight: FontWeight.w400),
                              const Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 32),
                                      backgroundColor:const Color(0xffF83758),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: const BorderSide(color: Colors.white),
                                      ),
                                  ),
                                  onPressed: (){}, child: const Center(child: Text('View All ->',style: TextStyle(color: Colors.white),),),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Image.asset('assets/image_png/offer.jpg'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
