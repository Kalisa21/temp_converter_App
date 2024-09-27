import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.green, // Primary color is green
      ),
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  final TextEditingController _tempController = TextEditingController();
  String _conversionType = 'F to C'; // Default selection
  String _convertedValue = '';
  final List<String> _history = [];

  void _convertTemperature() {
    double inputTemp = double.tryParse(_tempController.text) ?? 0.0;
    double resultTemp;

    if (_conversionType == 'F to C') {
      resultTemp = (inputTemp - 32) * 5 / 9;
    } else {
      resultTemp = inputTemp * 9 / 5 + 32;
    }

    setState(() {
      _convertedValue = resultTemp.toStringAsFixed(2);
      _history.insert(0,
          "$_conversionType: $inputTemp => $_convertedValue"); // Add to history
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      backgroundColor: Colors.green, // Set background color to green
      body: SingleChildScrollView(  // Wrap in SingleChildScrollView for smaller screens
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Conversion selection (Radio buttons)
              const Text(
                'Conversion:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Fahrenheit to Celsius',
                        style: TextStyle(color: Colors.white), // Set text to white
                      ),
                      leading: Radio<String>(
                        value: 'F to C',
                        groupValue: _conversionType,
                        onChanged: (String? value) {
                          setState(() {
                            _conversionType = value!;
                          });
                        },
                        activeColor: Colors.white, // Set active radio button color to white
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Celsius to Fahrenheit',
                        style: TextStyle(color: Colors.white), // Set text to white
                      ),
                      leading: Radio<String>(
                        value: 'C to F',
                        groupValue: _conversionType,
                        onChanged: (String? value) {
                          setState(() {
                            _conversionType = value!;
                          });
                        },
                        activeColor: Colors.white, // Set active radio button color to white
                      ),
                    ),
                  ),
                ],
              ),
              // User temperature entry
              TextField(
                controller: _tempController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white), // Set input text to white
                decoration: const InputDecoration(
                  labelText: 'Enter temperature',
                  labelStyle: TextStyle(color: Colors.white), // Set label to white
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white), // Set border color to white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set focused border color to white
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Convert button
              Center(
                child: ElevatedButton(
                  onPressed: _convertTemperature,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Set button background to white
                  ),
                  child: Text(
                    'CONVERT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Set button text to green
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Converted value display
              Text(
                'Converted Value: $_convertedValue',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              // History of conversions
              SizedBox(
                height: 150, // Add fixed height or use Flexible/Expanded
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _history[index],
                        style: const TextStyle(
                            color: Colors.white), // Set history text to white
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
