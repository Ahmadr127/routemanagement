import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[600],
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Icon(
                              Icons.download,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pemasukkan",
                                    style: TextStyle(
                                        // fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Rp. 250.000.000",
                                    style: TextStyle(
                                        // fontSize: 10,

                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Icon(
                              Icons.upload,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pengeluaran",
                                    style: TextStyle(
                                        // fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Rp. 250.000.000",
                                    style: TextStyle(
                                        // fontSize: 10,

                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
            // const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Transaction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 10),
                      Icon(Icons.edit)
                    ],
                  ),
                  // Add an icon or remove the Row
                  title: const Text("Rp 20.000.00,-"),
                  subtitle: const Text("Makan Siang"),
                  leading: Container(
                    child: Icon(
                      Icons.upload,
                      color: Colors.red, size: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 10),
                      Icon(Icons.edit)
                    ],
                  ),
                  // Add an icon or remove the Row
                  title: const Text("Rp 20.000.00,-"),
                  subtitle: const Text("Gajian Bulanan"),
                  leading: Container(
                    child: Icon(
                      Icons.download,
                      color: Colors.blue, size: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
