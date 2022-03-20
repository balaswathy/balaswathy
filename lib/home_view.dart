import 'package:demo/color_themes.dart';
import 'package:demo/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'shopping_cart.dart';




class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allProducts.length;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _appbarContainer(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    //Popular Products
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PRODUCTS',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackText ,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    SizedBox(
                        height: size.height,
                        child: StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            itemCount: allProducts.length,
                            staggeredTileBuilder: (int index) =>
                            new StaggeredTile.count(2, index.isEven ? 2.8 : 2.5),
                            mainAxisSpacing: 3.0,
                            crossAxisSpacing: 3.0,
                            itemBuilder: (context, index){
                              return InkWell(
                                // onTap: ()=> Get.to(ProductView()),

                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.only(left: kDefaultPaddin, top: 10, bottom: 10,right: kDefaultPaddin),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all( Radius.circular(5),),),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                                            color: Colors.white,
                                            image: DecorationImage(image: AssetImage(allProducts[index].image,), fit: BoxFit.cover,alignment: Alignment.topCenter),
                                          ),
                                        ),

                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10 ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              allProducts[index].pName,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color:  AppColors.blackText,
                                              ),
                                            ),
                                            Text(
                                              "${allProducts[index].pDetails}",
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'TeXGyreAdventor-Regular',
                                                fontWeight: FontWeight.normal,
                                                color:  AppColors.blackText,
                                              ),

                                            ),
                                            Row(

                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "\$ ${allProducts[index].pCost}",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color:  AppColors.blackText,
                                                  ),

                                                ),
                                                allProducts[index].isCartAdded == true?   InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      Get.snackbar("", "",colorText: Colors.red,backgroundColor: Colors.black54,titleText: Text("Product already added in the cart",style: TextStyle(color: Colors.red,fontSize: 18,),));
                                                    });
                                                  },
                                                  child: Card(
                                                    elevation: 2,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all( Radius.circular(10),),),


                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all( Radius.circular(10),),
                                                        gradient: AppColors.secondGradient,
                                                      ),
                                                      padding:const EdgeInsets.all(8.0),
                                                      child: Center(
                                                          child: Text("Item added",style: TextStyle(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.normal),)

                                                      ),
                                                    ),
                                                  ),
                                                ):
                                                InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      allProducts[index].isCartAdded = true; /// initially iscart selection is "FALSE" in default ,,, after user click add to cart will be changed to "TURE"
                                                      print(" true ${allProducts[index].isCartAdded}");
                                                      Get.snackbar("", "",colorText: Colors.red,backgroundColor: Colors.green.shade100,titleText: Center(child: Text("Product added successfully",style: TextStyle(color: Colors.black,fontSize: 18,),)));

                                                      /// then selected item added to insideCart list
                                                      insideCart.add(  Cart(pName: allProducts[index].pName, pId: allProducts[index].pId,pCategory: allProducts[index].pCategory,pAvailability: allProducts[index].pAvailability,pCost: allProducts[index].pCost,pDetails: allProducts[index].pDetails,image: allProducts[index].image ,),);
                                                      print("cart ${insideCart[0].pName}");

                                                    });
                                                  },
                                                  child: Card(
                                                    elevation: 2,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all( Radius.circular(10),),),


                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all( Radius.circular(10),),
                                                        gradient: AppColors.appGradient,
                                                      ),
                                                      padding:const EdgeInsets.all(8.0),
                                                      child: Center(
                                                          child: Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)

                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              );

                              // return InkWell(
                              //   onTap: ()=> Get.to(ProductView()),
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(left: kDefaultPaddin, right: kDefaultPaddin,top: kDefaultPaddin),
                              //     child:
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(right: 10, top: 50, bottom: 10, left: 10),
                              //         child: Column(
                              //           mainAxisAlignment: MainAxisAlignment.end,
                              //           crossAxisAlignment: CrossAxisAlignment.start,
                              //           children: [
                              //           Expanded(
                              //             child: Container(
                              //
                              //             decoration: BoxDecoration(
                              //                 image: DecorationImage(image: AssetImage('assets/images/sukini.png'),fit: BoxFit.fitHeight),
                              //             ),),
                              //           ),
                              //
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // );
                            }
                        )
                    ),



                    //Daily best selles
                  ],
                ),
              ),
            )

          ],
        ),

      ),
    );
  }

  Widget _appbarContainer(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.height * 100,

      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: kDefaultPaddin),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpg",),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(kDefaultPaddin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 // Image.asset("assets/icons/glass.png", scale: 20,color: AppColors.blackText),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Stack(
                    children: [
                      IconButton(onPressed: (){
                        Get.to(CartView());
                      }, icon: Icon(Icons.shopping_cart_rounded,color: Colors.black)),
                      Positioned(
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: AppColors.appPrimary,
                           radius: 10,
                          child: Center(
                            child: Text(
                              insideCart.length.toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color:  AppColors.blackText,
                            ),
                      ),
                    ),
                  ),
                ),

              ],

            ),

                ],
              ),
            )
        ],
      ),

    );



  }


}









