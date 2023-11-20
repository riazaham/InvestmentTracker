import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_tracker/dashboard/bloc/dashboard_cubit.dart';
import 'package:investment_tracker/dashboard/data/dashboard_model.dart';

class SymbolListViewItem extends StatelessWidget {
  const SymbolListViewItem({
    Key? key,
    required this.symbolDetail,
    required this.isSelected,
  }) : super(key: key);
  final SymbolDetail symbolDetail;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        color: isSelected ? Colors.blue.shade50 : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.blue,
            ),
            child: Text(
              symbolDetail.id,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(symbolDetail.name),
        ],
      ),
    );
  }
}
