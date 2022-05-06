import 'package:flutter/material.dart';
import 'package:foodapp/models/order.dart';
import '../data/data.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({Key? key}) : super(key: key);

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(order.food.imageUrl),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 0.8,
                              color: Colors.black54,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .primaryColor),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                order.quantity.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'N${order.quantity * order.food.price}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var order in currentUser.cart) {
      totalPrice += order.quantity * order.food.price;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart(${currentUser.cart.length})',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      //TODO:ask king
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Estimated Delivery Time',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25 min',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text(
                      'Total Cost',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'N ${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
        const Divider(
          height: 1.0,
          color: Colors.black,
        ),
      ),
      bottomSheet: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: TextButton(
            onPressed: (){},
            child: const Text('CheckOut',
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 22.0,
              color: Colors.white
            ),),
          ),
        ),

      ),
    );
  }
}
