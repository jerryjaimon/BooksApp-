import 'dart:convert';

import 'package:booksapp/data/people_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fetch_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IndividualPeopleData> data = [];
  bool flag = false;

  Future<PeopleData> getData() async {
    final jsonDecoded = await SearchResults().fetchSearchResults();
    return jsonDecoded;
  }

  @override
  Widget build(BuildContext context) {
    PeopleData response;
    getData().then((value) {
      setState(() {
        response = value;
        data = response.data;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("BooksApp"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ImageView(flag),
                          Text(
                            data[index].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data[index].company,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DetailsView(
                              flag,
                              data[index].id,
                              data[index].orderId,
                              data[index].invoicePending,
                              data[index].invoicePaid),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  flag = !flag;
                },
                child: Text('Expand')),
          ],
        ),
      ),
    );
  }

  Widget ImageView(bool flag) {
    if (flag == true) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: const CircleAvatar(
          child: Icon(Icons.person),
          minRadius: 25,
        ),
      );
    } else
      return Container();
  }

  Widget DetailsView(
      bool flag, int id, int orderid, int invoicepaid, int invoicepending) {
    if (flag == true) {
      return Column(
        children: [
          Text("ID:$id"),
          Text("Order ID:$orderid"),
          Text("Invoice Paid:$invoicepaid"),
          Text("Invoice Pending:$invoicepending"),
          const SizedBox(height: 5),
        ],
      );
    } else
      return Container();
  }
}
