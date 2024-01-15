import 'package:counter_app_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => counter_provider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter App Provider'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<counter_provider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Consumer<counter_provider>(builder: (context, data, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${data.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      }),
      floatingActionButton: Row(children: [
        FloatingActionButton(
          onPressed: () => stateProvider.increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => stateProvider.decrement(),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
