import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Category {
  final int id;
  final String name;
  final int type; // 1 for income, 2 for expense

  Category(this.id, this.name, this.type);
}

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isExpense = true;
  late int type;
  Category? selectedCategory;
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Category> categories = [
    Category(1, "Food", 2),
    Category(2, "Salary", 1),
    Category(3, "Transport", 2),
  ];

  @override
  void initState() {
    super.initState();
    type = 2;
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Transaksi")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Switch(
                    value: isExpense,
                    inactiveTrackColor: Colors.green[200],
                    inactiveThumbColor: Colors.green,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        isExpense = value;
                        type = (isExpense) ? 2 : 1;
                        selectedCategory = null;
                      });
                    },
                  ),
                  Text(
                    isExpense ? "Pengeluaran" : "Pemasukkan",
                    style: GoogleFonts.montserrat(fontSize: 14),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Amount',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Category", style: GoogleFonts.montserrat()),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<Category>(
                  isExpanded: true,
                  value: selectedCategory,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  onChanged: (Category? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items: categories
                      .where((category) => category.type == type)
                      .map<DropdownMenuItem<Category>>((Category category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(labelText: "Enter Date"),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double
                      .infinity, // This makes the button fill the width of the parent container
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform save operation here
                      // insert(
                      //     descriptionController.text,
                      //     selectedCategory!.id,
                      //     int.parse(amountController.text),
                      //     DateTime.parse(dateController.text));
                      Navigator.pop(context, true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      // onPrimary: Colors.white, // Button text color
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // Button height
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Optional rounded corners
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
