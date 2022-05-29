import 'package:flutter/material.dart';
import '../module/transaction.dart';
import 'package:intl/intl.dart'; // package for the date format

// stateless widget for the display the trnasaction list
class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      // ListView.builder is more optimize than ListView when the list is very long
      child: ListView.builder(
          itemCount: transaction.length,
          // you can use the ListView insted of SinglecildListview and you can also use the listview.builer widget
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      '${transaction[index].amount} ₹', // this is called string interpolation
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 48, 216, 53),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 44, 218, 50),
                        width: 2,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(transaction[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Container(
                        child: Text(
                          DateFormat.yMMMd().format(transaction[index].date),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
      // children: transaction.map((tx) {}).toList(),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: ListView(
//         // you can use the ListView insted of SinglecildListview and you can also use the listview.builer widget
//         children: transaction.map((transaction[index]) {
//           return Card(
//             child: Row(
//               children: [
//                 Container(
//                   child: Text(
//                     '${transaction[index].amount}  ₹', // this is called string interpolation
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Color.fromARGB(255, 48, 216, 53),
//                     ),
//                   ),
//                   margin: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
//                   padding: EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                     color: Color.fromARGB(255, 44, 218, 50),
//                     width: 2,
//                   )),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(transaction[index].title,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           )),
//                     ),
//                     Container(
//                         child: Text(
//                       DateFormat.yMMMd().format(transaction[index].date),
//                       style: TextStyle(fontWeight: FontWeight.w300),
//                     ))
//                   ],
//                 )
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
