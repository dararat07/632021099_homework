import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required String title});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<ListItem> _fruits = [
    ListItem(1, 'Apple'),
    ListItem(2, 'Papaya'),
    ListItem(3, 'Banana'),
  ];
  
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(_fruits);
    _selectedItem = _dropdownMenuItems[0].value!;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> fruits) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in fruits) {
      items.add(DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ));
    }
    return items;
  }

  List<Widget> createCheckbox() {
    List<Widget> myproducts = [];
    var products;
    for (Product Product in products) {
      myproducts.add(CheckboxListTile(
        title: Text(Product.productName),
        value: Product.checked,
        onChanged: (value) {
          setState(() {
            Product.checked = value as Boolean;
          });
        },
      ));
    }
    return myproducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lab 06")),
      body: SafeArea(
          child: ListView(
        children: [
          DropdownButton(
            value: _selectedItem,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          )
        ],
      )),
    );
  }
}

class ListItem {
  final String name;
  final int value;
  ListItem(this.value, this.name);
}

class Product {
  final String productId;
  final String productName;
  final String amount;
  final double price;
  Boolean checked;
  Product({required this.productId, required this.productName,required this.amount, required this.price, required this.checked});
}

class Boolean {
}