import 'package:flutter/material.dart';
import 'package:sci_calculator/src/src.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String> _textNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> _lastNotifier = ValueNotifier<String>('');
  final ValueNotifier<double> _axisNotifier = ValueNotifier<double>(0.6);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _textNotifier.value = _controller.text;
    });
  }

  void handleAxisChange(double value) =>
      setState(() => _axisNotifier.value = value);

  void _setLastText(String text) => setState(() => _lastNotifier.value = text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sci Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Display(
                textNotifier: _textNotifier, lastNotifier: _lastNotifier),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * _axisNotifier.value,
            child: KeyPad(
                controller: _controller,
                axisManager: handleAxisChange,
                setLastText: _setLastText),
          ),
        ],
      ),
    );
  }
}
