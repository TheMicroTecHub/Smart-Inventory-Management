import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/venddashboard.dart';
import 'package:simsfyp/purchaseinventory.dart';
import 'package:simsfyp/addcreditnotes.dart';

class VendorPurchase extends StatefulWidget {
  const VendorPurchase({Key? key}) : super(key: key);

  @override
  State<VendorPurchase> createState() => _VendorPurchaseState();
}

class _VendorPurchaseState extends State<VendorPurchase> {
  final dbShowRefrence = FirebaseDatabase.instance.ref('Purchase Order');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Purchase Order');
  //controllers
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const vendordashboard()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text("Purchase Orders"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: dbShowRefrence,
                itemBuilder: (context, snapshot, animation, index) {
                  final name = snapshot.child('name').value.toString();
                  final quantity = snapshot.child('quantity').value.toString();
                  final price = snapshot.child('price').value.toString();
                  final grandtotal =
                  snapshot.child('grand total').value.toString();
                  final purchaseid =
                  snapshot.child('purchaseid').value.toString();
                  final keyid = snapshot.key;

                  if (searchController.text.isEmpty) {
                    return Container(
                      margin:
                      const EdgeInsets.only(top: 12, left: 10, right: 12),
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 3.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                padding: const EdgeInsets.all(08),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Qty: $quantity",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Price: $price",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Grand Total: $grandtotal",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  ref.child(keyid.toString()).remove();
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddCreditNote(
                                          name,
                                          quantity,
                                          price,
                                          grandtotal,
                                          purchaseid),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.credit_score),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else if (name
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())) {
                    return Container(
                      margin:
                      const EdgeInsets.only(top: 12, left: 10, right: 12),
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 3.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                padding: const EdgeInsets.all(08),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Qty: $quantity",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Price: $price",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Grand Total: $grandtotal",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  ref.child(keyid.toString()).remove();
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddCreditNote(
                                          name,
                                          quantity,
                                          price,
                                          grandtotal,
                                          purchaseid),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.credit_score),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PurchaseInventory()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
