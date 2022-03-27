import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircularPercentIndicator(
                  radius: screenSize.width / 2,
                  lineWidth: 10.0,
                  percent: .5,
                  backgroundColor: Colors.white,
                  center: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "\$0",
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Balance",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  progressColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const TransactionCard(
                amount: 105.99,
                text: "Apple Watch",
                isExpense: true,
              ),
              const TransactionCard(
                amount: 800,
                text: "Apple iPhone",
                isExpense: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String text;
  final double amount;
  final bool isExpense;
  const TransactionCard(
      {required this.amount,
      required this.text,
      required this.isExpense,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: const Offset(0, 25),
              blurRadius: 50,
            )
          ],
        ),
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Text(
              (isExpense ? "+ " : "- ") + amount.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
