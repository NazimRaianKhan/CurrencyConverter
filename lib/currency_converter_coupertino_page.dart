import 'package:flutter/cupertino.dart';

class CurrencyConverterCoupertinoPage extends StatefulWidget {
  const CurrencyConverterCoupertinoPage({super.key});

  @override
  State<CurrencyConverterCoupertinoPage> createState() => _CurrencyConverterCoupertinoPageState();
}

class _CurrencyConverterCoupertinoPageState extends State<CurrencyConverterCoupertinoPage> {

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 117.25;
    });
  }

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text('Current Converter'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BDT ${result!=0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0) } tk', //result.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration:BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: 'Please enter the amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: () {
                  convert();
                },
                minSize: 50,
                color: CupertinoColors.black,
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
