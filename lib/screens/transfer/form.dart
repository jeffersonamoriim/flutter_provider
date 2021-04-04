import 'package:flutter/material.dart';
import 'package:flutter_provider/components/editor.dart';
import 'package:flutter_provider/models/transfer.dart';

const _appBarTitle = 'New Transfer';

const _labelValueField = 'Value';
const _hintValueField = '0.00';

const _labelAccountNumber = 'Account Number';
const _hintAccountNumber = '0000';

const _confirmButtonText = 'Confirm';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _accountNumberController,
                hint: _hintAccountNumber,
                label: _labelAccountNumber,
              ),
              Editor(
                controller: _valueController,
                hint: _hintValueField,
                label: _labelValueField,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_confirmButtonText),
                onPressed: () => _createTransfer(context),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => Colors.deepPurpleAccent)),
              ),
            ],
          ),
        ));
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double value = double.tryParse(_valueController.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, createdTransfer);
    }
  }
}
