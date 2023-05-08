import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: backColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          backgroundColor: backColor,
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Введите код',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'На ваш телефон ${widget.number} поступит звонок.\n'
            'Введите последние 4 цифры звонящего номера',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: taskColor,
              fontWeight: FontWeight.w400,
            ),
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
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Pinput(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        length: 4,
        enabled: false,
        controller: _textController,
        defaultPinTheme: PinTheme(
          width: 66,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 5,
                color: Color.fromRGBO(123, 97, 255, 0.1),
              ),
            ],
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 32,
            color: taskColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        bottom: 0,
        left: 16,
        right: 16,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 51,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: gradientColor,
          ),
          child: MaterialButton(
            onPressed: () {},
            child: const Text(
              'Запросить ещё раз',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
