import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor Monetário',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // variáveis
  TextEditingController realController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONVERSOR MONETÁRIO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 194, 243, 151),
      ),
      backgroundColor: Color.fromARGB(255, 194, 243, 151),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/image.png',
              height: 244,
              width: 275,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: realController,
              decoration: InputDecoration(
                  labelText: 'Digite o valor em real', prefixText: 'R\$'),
              onChanged: (value) {
                double realValor = double.tryParse(value) ?? 0;
                double dolarValor = realValor / 5.20;
                double euroValor = realValor / 5.55;
                dolarController.text = dolarValor.toStringAsFixed(2);
                euroController.text = euroValor.toStringAsFixed(2);
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              controller: dolarController,
              decoration: InputDecoration(
                  labelText: 'Digite o valor em dólar', prefixText: '\$'),
              onChanged: (value) {
                double dolarValor = double.tryParse(value) ?? 0;
                double realValor = dolarValor * 5.20;
                double euroValor = dolarValor / 5.55;
                realController.text = realValor.toStringAsFixed(2);
                euroController.text = euroValor.toStringAsFixed(2);
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              controller: euroController,
              decoration: InputDecoration(
                  labelText: 'Digite o valor em euro', prefixText: '€'),
              onChanged: (value) {
                double euroValor = double.tryParse(value) ?? 0;
                double dolarValor = euroValor / 5.20;
                double realValor = euroValor * 5.55;
                dolarController.text = dolarValor.toStringAsFixed(2);
                realController.text = realValor.toStringAsFixed(2);
              },
            ),
            Text(
              'Giovana Duarte/ grupo 08',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
