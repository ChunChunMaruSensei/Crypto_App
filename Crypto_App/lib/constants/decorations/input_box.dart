import 'package:flutter/material.dart';


InputDecoration firstCurrency = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  labelText: 'สกุลเงินตั้งต้น'
);

InputDecoration secondCurrency = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
      borderRadius: BorderRadius.circular(15.0),
    ),
    labelText: 'สกุลเงินที่จะเปลี่ยน'
);

InputDecoration amountBox = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
      borderRadius: BorderRadius.circular(15.0),
    ),
    labelText: 'จำนวนเงินตั้งต้น'
);