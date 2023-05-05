import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading:
      //   IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       color: Color.fromARGB(255, 0, 0, 0),
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
              color: Color.fromRGBO(
                123,
                97,
                255,
                1,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Pinput(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              length: 4,
              enabled: false,
              controller: _textController,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ],
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                textStyle: const TextStyle(
                  fontSize: 32,
                  color: Color.fromRGBO(123, 97, 255, 1),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 0,
              left: 12,
              right: 12,
            ),
            child: SizedBox(
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.centerLeft,
              //     end: Alignment.centerRight,
              //     colors: [
              //       Color(0x007C62FF),
              //       Color(0x00BA62FF),
              //     ],
              //   ),
              // ),
              width: double.infinity,
              height: 51,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(124, 98, 255, 1),
                      Color.fromRGBO(186, 98, 255, 1)
                      // Color.fromRGBO(124, 98, 255, 0),
                      // Color.fromRGBO(186, 98, 255, 0),
                    ],
                    // stops: [
                    //   0.1,
                    //   0.4,
                    //   0.6,
                    //   0.9,
                    // ],
                  ),
                ),
                // child:
                // Container(
                //   constraints: const BoxConstraints(
                //     minWidth: 88.0,
                //     minHeight: 36.0,
                //   ), // min sizes for Material buttons
                //   alignment: Alignment.center,
                child: MaterialButton(
                  // style: ElevatedButton.styleFrom(
                  //   // backgroundColor: Color,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  // ),
                  onPressed: () {},
                  child: const Text(
                    'Запросить ещё раз',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    // ),
                  ),
                  // const Text("Запросить ещё раз"),
                ),
              ),
            ),
          ),
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
