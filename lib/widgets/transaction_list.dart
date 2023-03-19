import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "no transaction to add!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.15,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    "Assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
          
            itemBuilder: (ctx, index) {
              
              final mediaQuery = MediaQuery.of(context);
              return transactionItem(transaction: transactions[index], mediaQuery: mediaQuery, deletetx: deletetx);
            },
              itemCount: transactions.length,
          );
  }
}

