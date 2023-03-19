import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class transactionItem extends StatelessWidget {
  const transactionItem({
    Key key,
    @required this.transaction,
    @required this.mediaQuery,
    @required this.deletetx,
  }) : super(key: key);

  final  Transaction transaction;
  final MediaQueryData mediaQuery;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
      child: ListTile(
        leading: CircleAvatar(
          radius: 35,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                "\₹ ${transaction.amount.toString()}",
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().add_jm().format(transaction.date),
        ),
        trailing: mediaQuery.size.width > 300
            ? TextButton.icon(
                onPressed: () {
                  deletetx(transaction.id);
                },
                icon: Icon(Icons.delete),
                style: TextButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: Theme.of(context).errorColor,
                ),
                label: Text("Delete"),
              )
            : IconButton(
                onPressed: () {
                  deletetx(transaction.id);
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
