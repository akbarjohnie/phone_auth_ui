import 'package:flutter/material.dart';
import 'package:simple_mobile_auth/screens/confirmation_screen.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  late final _textController = TextEditingController();

  @override
  void initState() {
    // чтобы не приходилось всё время вводить номер для перехода на следующий экран
    _textController.text = '+7 (123) 111-22-33';
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Введите номер'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onTapOutside: (e) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              controller: _textController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (_textController.text.split(' ').join().length >= 11) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ConfirmationScreen(number: _textController.text),
                  ),
                );
              }
            },
            child: const Text('Подтвердить'),
          ),
        ],
      ),
    );
  }
}
