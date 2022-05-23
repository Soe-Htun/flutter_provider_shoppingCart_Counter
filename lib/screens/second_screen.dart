import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/shopping_cart_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _addDataController = TextEditingController();
    Future addDialog() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Data'),
            content: TextField(
              controller: _addDataController,
              decoration: const InputDecoration(
                hintText: "Enter Data"
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: (){
                  context.read<ShoppingCart>().addItem(_addDataController.text);
                  Navigator.pop(context);
                }, 
                child: const Text("ADD")
              )
            ],

          );
        });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider example App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${context.watch<ShoppingCart>().count}'),
            Text('${context.watch<ShoppingCart>().cart}'),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // context.read<ShoppingCart>().addItem('Bread');
          addDialog();
        },
      ),
    );
  }
}