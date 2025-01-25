import 'package:amar_wallet/core/app_colors.dart';
import 'package:amar_wallet/core/app_icons.dart';
import 'package:amar_wallet/core/app_images.dart';
import 'package:amar_wallet/module/global_widget/custom_image.dart';
import 'package:amar_wallet/module/home/controller/home_bloc.dart';
import 'package:amar_wallet/module/home/controller/home_event.dart';
import 'package:amar_wallet/module/home/controller/home_state.dart';
import 'package:amar_wallet/module/home/model/card_model.dart';
import 'package:amar_wallet/routes/pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../global_widget/custom_icon_button.dart';
import 'components/card_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc? _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc?.add(GetCardListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: _userAvater(),
        actions: [
          CustomIconButton(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.searchPage);
            },
            icon: AppIcons.searchIcon,
          ),
          const SizedBox(width: 8),
          CustomIconButton(
            onTap: () {},
            icon: AppIcons.notificationOnline,
          ),
          const SizedBox(width: 16)
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: CustomScrollView(
            slivers: [
              ///horizontal slider
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    CarouselSlider.builder(
                        itemCount: 5,
                        itemBuilder: (context, index, realIndex) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const CustomImage(
                              path: AppImages.cardImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 222,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 222,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                          reverse: false,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            _homeBloc?.add(ChangeSliderActiveIndexEvent(index));
                          },
                        )),
                    const SizedBox(height: 24),

                    ///active index
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.sliderItem,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            padding: const EdgeInsets.all(1),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.semiBlack),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == state.activeIndex
                                      ? AppColors.semiBlack
                                      : Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),

              ///vertical card list
              SliverList.builder(
                  itemCount: state.cardList.length,
                  itemBuilder: (context, index) {
                    var card = state.cardList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CardItem(
                        card: card,
                        index: index,
                      ),
                    );
                  })
            ],
          ),
        );
      }),
      floatingActionButton: Material(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.floatingBtnColor,
        elevation: 1,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.addPage);
          },
          borderRadius: BorderRadius.circular(8),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.add),
                Text(
                  "Add to Wallet",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _userAvater() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.greyColor),
              child: const CircleAvatar(
                backgroundImage: AssetImage(AppImages.user),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.nutralColor),
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 10,
                    color: AppColors.semiBlack,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
