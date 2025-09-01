import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/providers/counterprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Boilerplate"),
      ),
      body: Center(
        child: Text(
          'Count: ${counterProvider.counter.count}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () => context.read<CounterProvider>().decrement(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () => context.read<CounterProvider>().increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
