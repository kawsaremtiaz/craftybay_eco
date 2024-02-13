import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductQtyManagement extends StatefulWidget {
  const ProductQtyManagement({super.key});

  @override
  State<ProductQtyManagement> createState() => _ProductQtyManagementState();
}

class _ProductQtyManagementState extends State<ProductQtyManagement> {


  // void _incrementQuantity(int index) {
  //   setState(() {
  //     products[index].quantity++;
  //   });
  // }

  // void _decrementQuantity(int index) {
  //   setState(() {
  //     if (products[index].quantity > 1) {
  //       products[index].quantity--;
  //     }
  //   });
  // }
  // double _calculateTotalPrice(int index) {
  //   return products[index].unitPrice * products[index].quantity;
  // }

  int itemTotalPrice = 100;
  // _totalPriceAmmount() {
  //   double totalPriceAmo = 0.0;
  //   for (int i = 0; i < products.length; i++) {
  //
  //     totalPriceAmo += _calculateTotalPrice(i);
  //
  //   }
  //   return Text("${totalPriceAmo.toString()}\$",
  //       style: const TextStyle(
  //           fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black));
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 24,
            width: 30,
            decoration: BoxDecoration(
                color: CraftyBayAppColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
                ]),
            child: IconButton(
              onPressed: () {

              },
              icon: const Icon(
                CupertinoIcons.plus,
                size: 10,
                color: Colors.white,
              ),
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("1",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        Container(
          height: 24,
          width: 30,
          decoration: BoxDecoration(
              color: CraftyBayAppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                )
              ]),
          child: IconButton(
            onPressed: () {

            },
            icon: const Icon(
              CupertinoIcons.minus,
              size: 10,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
