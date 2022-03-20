import 'package:demo/color_themes.dart';
import 'package:demo/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'home_view.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

RxDouble totalPrice = 0.0.obs;
RxDouble subTotalPrice = 0.0.obs;
class _CartViewState extends State<CartView> {

  _getTotal(){
    changeTotalPrice();

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTotal();
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
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          leading: IconButton(
            color: AppColors.blackText,
            icon: Icon(Icons.arrow_back_ios_rounded,size: 25,),
            onPressed: () => Get.back(),
          ),
          /*actions: [
            Stack(
              children: [
                InkWell(
                  onTap: (){
                    //Get.to(CartView());
                  },
                  child: Stack(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_rounded,color: Colors.black)),
                      Positioned(
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: AppColors.appPrimary,
                          radius: 10,
                          child: Center(
                            child: Text(
                              "0" ,
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
                ),
              ],*/
            ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              addedProduct(),
              SizedBox(
                height: size.height*0.02,
              ),
              subTotal()

            ],
          ),
        ),
      ),
    );
  }

  Widget addedProduct() {
    Size size = MediaQuery.of(context).size;
    return AnimationLimiter(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: insideCart.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                verticalOffset: 80.0,
                duration: const Duration(milliseconds: 1500),
                child: FadeInAnimation(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin,vertical: kDefaultPaddin),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,



                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: size.height * 0.1,
                                  width: size.width * 0.02,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: Offset(4.0,4.0),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.shade100,
                                          offset: Offset(-4.0,-4.0),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                        )
                                      ],
                                    image: DecorationImage(
                                      image: AssetImage(insideCart[index].image,),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width*0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(

                                    children: [
                                      Container(
                                        width: size.width*0.2,
                                        child: Text(
                                          insideCart[index].pName.toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color:  AppColors.blackText,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width*0.25,
                                      ),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          ///delete cart selected cart item

                                          insideCart.removeAt(index);
                                          Get.snackbar("", "",colorText: Colors.red,backgroundColor: Colors.black54,titleText: Text("Item Removed",style: TextStyle(color: Colors.red,fontSize: 18,),));

                                          changeTotalPrice();
                                        });

                                      }, icon: Icon(Icons.delete_rounded,size: 25,color: Colors.grey,),)
                                    ],
                                  ),
                                  Row(

                                    children: [
                                      Container(
                                        width: size.width*0.3,
                                        child: Text(
                                          "\$ ${insideCart[index].pCost}",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:  AppColors.appPrimary,
                                          ),

                                        ),
                                      ),

                                      Container(
                                        height: size.width *0.08,
                                        width: size.width *0.25,
                                        decoration: BoxDecoration(
                                          //border: Border.all(color: Colors.black54, width: 1),
                                          //borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [

                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  print("decrement Quantity is clicked");
                                                  decreaseQuantity(index);
                                                  changeTotalPrice();
                                                });

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: AppColors.iconsClr,width: 1),
                                                    borderRadius: BorderRadius.all(Radius.circular(2))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: Image.asset("assets/icons/minus.png",scale: 40,),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              insideCart[index].quantity.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color:  AppColors.blackText,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                print("increase Quantity is clicked");
                                                setState(() {
                                                  increaseQuantity(index);
                                                  changeTotalPrice();
                                                });

                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: AppColors.iconsClr,width: 1),
                                                      borderRadius: BorderRadius.all(Radius.circular(2))),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Image.asset("assets/icons/plus.png", scale: 50,color: Colors.black,),
                                                  )),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );

  }

  Widget subTotal(){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SUB TOTAL",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color:  AppColors.blackText,
                ),
              ),
              Obx(()=>Text(
                "\$ ${subTotalPrice.toString()} USD",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color:  AppColors.blackText,
                ),
              ),),
            ],
          ),
          SizedBox(height: size.height*0.03,child: Divider(color: AppColors.appBgColor, thickness: 2,),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TOTAL",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color:  AppColors.blackText,
                ),
              ),
              Obx(()=>
                  Text(
                    "\$ ${totalPrice.toString()} USD",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:  AppColors.appPrimary,
                    ),
                  ),
              ),

            ],
          ),
          SizedBox(
              height: size.height*0.02
          ),
          Container(
            height: size.width *0.15,
            width: size.width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all( Radius.circular(10),),
              gradient: AppColors.appGradient,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                elevation: 0,
                minimumSize: Size( size.width *0.85, size.height*0.15),
                primary: Colors.transparent,

                shape:RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              onPressed: (){
               //Get.to(SelectPaymentMethod());
              },
              child:Center(child: Text(
                "Checkout" ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white,
                ),
              ),),


            ),
          ),
        ],
      ),
    );
  }
  }






///cart calculation part

decreaseQuantity(int index){
  if(insideCart[index].quantity == 1) {
    ///todo remove cart
  }else{
    insideCart[index].quantity--;
    changeTotalPrice();
  }
}

increaseQuantity(int index){
  print(index);
  insideCart[index].quantity++;
  changeTotalPrice();

}

changeTotalPrice(){
  if(insideCart.isNotEmpty){
    subTotalPrice.value = insideCart.map<double>((element) =>  (double.parse(element.pCost.toString()) * int.parse(element.quantity.toString()))).reduce((value, element) => value+element);
    totalPrice.value = subTotalPrice.value;
  }
}

