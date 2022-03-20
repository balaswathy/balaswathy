import 'package:get/get.dart';


///class for product list

class Products{
  Products(
      {
    required this.pName,
    required this.pId,
    required this.pCost,
    required this.pAvailability,
    required this.pDetails,
    required this.pCategory,
    required this.image
  }
  );

  final String pName;
  final int pId;
  final int pCost;
  final int pAvailability;
  final String pDetails;
  final String pCategory;
  final String image;
  bool isCartAdded = false;
}

///product list ---->

List<Products> allProducts = <Products>[

   Products(pName: "Apple", pId: 1,pCategory: "Premium",pAvailability: 1,pCost: 30,pDetails: "Imported from Swiss",image:"assets/images/apple.jpg" , ),
   Products(pName: "Mango", pId: 2,pCategory: "Premium",pAvailability: 2,pCost: 50,pDetails: "Farmed at Selam",image:"assets/images/mango.jpg" ,),
   Products(pName: "Banana", pId: 3,pCategory: "Premium",pAvailability: 3,pCost: 3,pDetails: "Imported from Swiss",image:"assets/images/banana.jpg" ,),
   Products(pName: "Orange", pId: 4,pCategory: "Premium",pAvailability: 4,pCost: 25,pDetails: "Premium",image:"assets/images/orange.jpg" ,),

];


///cart list class
class Cart{
  Cart(
      {
        required this.pName,
        required this.pId,
        required this.pCost,
        required this.pAvailability,
        required this.pDetails,
        required this.pCategory,
        required this.image
      }
      );

  final String pName;
  final int pId;
  final int pCost;
  final int pAvailability;
  final String pDetails;
  final String pCategory;
  final String image;
  bool isCartAdded = false;
  int quantity = 1;

}


///cart list items will be added to list based selection
List<Cart> insideCart = <Cart>[];
