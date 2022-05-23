import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void decrement () {
    context.read<Counter>().decrement();
  }
  late bool isBtnActive;

  @override
  Widget build(BuildContext context) {
    // final decrement = context.read<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times: ${context.watch<Counter>().count} "),
            const Count(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              }, 
              child: const Text("Go Second Screen")
            )
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            // onPressed: (){
            //   context.read<Counter>().decrement();
            //   // context.
            // }
            onPressed: context.watch<Counter>().count == 0? null : decrement ,
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            tooltip: 'Reset',
            child: const Icon(Icons.exposure_zero),
            onPressed: (){
              context.read<Counter>().reset();
            }
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            onPressed: (){
              context.read<Counter>().increment();
            }
          ),
        ],
      ),
      
    );
  }
}

class Count extends StatelessWidget {
  const Count({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}