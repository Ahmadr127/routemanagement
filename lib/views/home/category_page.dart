import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category {
  final int id;
  final String name;
  final int type; // 1 for income, 2 for expense

  Category(this.id, this.name, this.type);
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool? isExpense;
  int? type;
  List<Category> listCategory = [];
  TextEditingController categoryNameController = TextEditingController();
  int categoryIdCounter = 1;

  @override
  void initState() {
    isExpense = true;
    type = (isExpense!) ? 2 : 1;
    super.initState();
  }

  void insert(String name, int type) {
    setState(() {
      listCategory.add(Category(categoryIdCounter++, name, type));
    });
  }

  void update(int categoryId, String newName) {
    setState(() {
      int index = listCategory.indexWhere((category) => category.id == categoryId);
      if (index != -1) {
        listCategory[index] = Category(categoryId, newName, listCategory[index].type);
      }
    });
  }

  void deleteCategory(int categoryId) {
    setState(() {
      listCategory.removeWhere((category) => category.id == categoryId);
    });
  }

  void openDialog(Category? category) {
    categoryNameController.clear();
    if (category != null) {
      categoryNameController.text = category.name;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: Center(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ((category != null) ? 'Edit ' : 'Add ') +
                      ((isExpense!) ? "Pengeluaran" : "Pemasukkan"),
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: (isExpense!) ? Colors.red : Colors.blue),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: categoryNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (category == null) {
                        insert(categoryNameController.text, isExpense! ? 2 : 1);
                      } else {
                        update(category.id, categoryNameController.text);
                      }
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                    child: Text("Save"))
              ],
            ))),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Switch(
                    value: isExpense!,
                    inactiveTrackColor: Colors.blue[200],
                    inactiveThumbColor: Colors.blue,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        isExpense = value;
                        type = (value) ? 2 : 1;
                      });
                    },
                  ),
                  Text(
                    isExpense! ? "Pengeluaran" : "Pemasukkan",
                    style: GoogleFonts.montserrat(fontSize: 14),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    openDialog(null);
                  },
                  icon: Icon(Icons.add))
            ],
          ),
        ),
        listCategory.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: listCategory.length,
                itemBuilder: (context, index) {
                  if (listCategory[index].type == type) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    deleteCategory(listCategory[index].id);
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    openDialog(listCategory[index]);
                                  },
                                )
                              ],
                            ),
                            leading: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: (isExpense!)
                                    ? Icon(Icons.upload,
                                        color: Colors.redAccent[400])
                                    : Icon(
                                        Icons.download,
                                        color: Colors.blue[400],
                                      )),
                            title: Text(listCategory[index].name)),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            : const Center(
                child: Text("No data"),
              ),
      ])),
    );
  }
}
