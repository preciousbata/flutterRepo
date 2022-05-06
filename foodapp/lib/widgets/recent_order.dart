import 'package:flutter/material.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  _buildRecentOrder(BuildContext context, Order order){
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
          color: Colors.white,
      borderRadius: BorderRadius.circular(150.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:BorderRadius.circular(15.0),
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:const EdgeInsets.all(12.0) ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.food.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          overflow:TextOverflow.ellipsis ,
                        ),
                        const SizedBox(height: 4.0,),
                        Text(order.restaurant.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0,),
                        Text(order.date,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 42.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.add),
              iconSize: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Recent Orders',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: 120.0,
          width: 500.0,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection:Axis.horizontal ,
            itemCount:currentUser.orders.length ,
              itemBuilder: (BuildContext context, int index){
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context,order);
              },
          ),

        ),
      ],
    );
  }
}
