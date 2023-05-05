import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:simple_mobile_auth/constants/color_constants.dart';
import 'package:simple_mobile_auth/widgets/keyboard_number.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key, required this.number});
  final String number;

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _textController;
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
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          const Text(
            'Введите код',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'На ваш телефон ${widget.number} поступит звонок.\n'
            'Введите последние 4 цифры звонящего номера',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: taskColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Поле с 4 ячейками для ввода кода подтверждения
          _CodeField(textController: _textController),
          const SizedBox(
            height: 50,
          ),
          // Кнопка "Запросить ещё раз" в градиентной раскраске
          const _GradientButton(),
          // "кастомная" клавиатура
          NumPad(
            delete: () {
              if (_textController.length > 4) {
                _textController.text = _textController.text.substring(0, 4);
              }
              _textController.text = _textController.text.substring(
                0,
                _textController.text.length - 1,
              );
            },
            controller: _textController,
          ),
        ],
      ),
    );
  }
}

class _CodeField extends StatelessWidget {
  const _CodeField({
    super.key,
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Pinput(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        length: 4,
        enabled: false,
        controller: _textController,
        defaultPinTheme: PinTheme(
          width: 66,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.3),
              ),
            ],
            border: Border.all(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 32,
            color: taskColor,
          ),
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 18.0,
        bottom: 0,
        left: 12,
        right: 12,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 51,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: gradientColor,
          ),
          child: MaterialButton(
            onPressed: () {},
            child: const Text(
              'Запросить ещё раз',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
