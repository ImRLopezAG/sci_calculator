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

  bool isDarkMode = true;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _textNotifier.value = _controller.text;
    });
  }

  void _toggleTHeme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _toggleTHeme,
          icon: isDarkMode
              ? const Icon(Icons.wb_sunny)
              : const Icon(Icons.nightlight_round),
        ),
        title: const Text("Sci Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Display(textNotifier: _textNotifier),
          ),
          Expanded(
            flex: 2,
            child: KeyPad(controller: _controller),
          ),
        ],
      ),
    );
  }
}
