import 'package:flutter/material.dart';
import 'package:flutter_testing_widget/widgets/date_picker_modal_bottom_widget.dart';
import 'package:flutter_testing_widget/widgets/transaction_card_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DatePickerModalBottomWidget(),
              ),
            ),
            child: Card(
              shadowColor: Theme.of(context).colorScheme.primary,
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Date Picker Modal Bottom Widget',
                    style: TextStyle(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TransactionCard(),
              ),
            ),
            child: Card(
              shadowColor: Theme.of(context).colorScheme.primary,
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Transaction Car Widget',
                    style: TextStyle(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
