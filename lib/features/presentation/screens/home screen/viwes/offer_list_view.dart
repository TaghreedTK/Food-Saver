/*import 'package:flutter/material.dart';

import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/widgets/offer_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/data/network/home_request.dart';

class OfferListView extends StatefulWidget {
  const OfferListView({super.key});

  @override
  State<OfferListView> createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  HomeRequest _homeData = HomeRequest();

  dummyData() async {
    return await [
      {'id': 1},
      {'id': 2}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _homeData.getHomeData(),
        // future: dummyData(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // error in data
              print(snapshot.error.toString());
              return Container();
            } else if (snapshot.hasData) {

              print("response has data : ${snapshot.hasData}");
              print("response data is : ${snapshot.data}");
              print("response data length is : ${snapshot.data.length}");
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: TSizes.gridViewSpacing,
                    mainAxisSpacing: TSizes.gridViewSpacing,
                    mainAxisExtent: 288),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: HerzontalOfferTile(
                      onPressed: () {},
                      color: Colors.red,
                      icon: Iconsax.heart5,
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else {
              print("no data");
              return Container();
            }
          } else {
            print("error in connection");
            return Container();
          }
        });
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_saver/features/presentation/model/offer_model.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/features/presentation/screens/home screen/widgets/offer_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/data/network/home_request.dart';

class OfferListView extends StatefulWidget {
   OfferListView({super.key, required this.future});
  var future;
  @override
  State<OfferListView> createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  var future;
  HomeRequest _homeData = HomeRequest();
  @override
  void initState() {
    super.initState();
    future = _homeData.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.future,
        builder: (context, AsyncSnapshot<dynamic>? snapshot) {
          if (snapshot!.hasError) {
            print(snapshot.error);
            return SliverToBoxAdapter(
              child: Center(
                child: Text("Error while getting data"),
              ),
            );
          } else {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                print('taghreed ${snapshot.data.length}');
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: TSizes.gridViewSpacing,
                      mainAxisSpacing: TSizes.gridViewSpacing,
                      mainAxisExtent: 288),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: HerzontalOfferTile(
                          
                          data: snapshot.data[index],
                        ),
                      );
                    },
                    childCount: snapshot.data.length,
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text("No Data"),
                  ),
                );
              }
            } else {
              return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            }
          }
        });
  }
}
        




/*

        if (snapshot!.hasError) {
          print(snapshot.error);
          print(snapshot.data);
          return Center(
            child: Text("Error while getting data"),
          );
        } else {
          if (snapshot.hasData) {
            //print(snapshot.data);
            // print(snapshot.data.length);

            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: TSizes.gridViewSpacing,
                  mainAxisSpacing: TSizes.gridViewSpacing,
                  mainAxisExtent: 288),
              delegate: SliverChildBuilderDelegate(childCount: snapshot.data.length,
                  (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: HerzontalOfferTile(
                    onPressed: () {},
                    color: Colors.red,
                    icon: Iconsax.heart5,
                  ),
                );
              }),
            );
          } else if (snapshot.hasData) {
            return Center(child: Text("no data"));
          } else {
            return CircularProgressIndicator();
          }*/
        
      
    /*SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: 288),
      delegate: SliverChildBuilderDelegate(childCount: 8,
          (BuildContext context, int index) {
        String offer = 'Offer $index';
        bool isFavorite = favorites.contains(offer);
        return Padding(
          padding: const EdgeInsets.only(right: 14),
          child: FutureBuilder(
            future: _homeData.getHomeData(),
            builder: (context, snapshot) {
              return HerzontalOfferTile(
                onPressed: () {
                  isFavorite
                      ? removeFromFavorites(offer)
                      : addToFavorites(offer);
                },
                color: isFavorite ? Colors.red : Colors.grey.shade600,
                icon: isFavorite ? Iconsax.heart5 : Icons.favorite_border,
              );
            },
          ),
        );
      }),*/
  
