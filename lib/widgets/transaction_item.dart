import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTx,
  });

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: SizedBox(
              // padding: EdgeInsets.all(10),
              child: Text('\$${transaction.amount}')),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text(
                  'Delete',
                ),
                onPressed: () => deleteTx(transaction.id),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).errorColor,
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
