import 'package:flutter/material.dart';

import '../../../utility/dimens.dart';
import '../styles/theme.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    Key? key,
    this.onTextInput,
    this.isOtp = false,
    this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String>? onTextInput;
  final VoidCallback? onBackspace;
  final bool isOtp;

  void _textInputHandler(String text) => onTextInput?.call(text);

  void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.5,
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
          // SizedBox(height: 30),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isOtp)
            TextKey(
              text: '.',
              onTextInput: _textInputHandler,
            )
          else
            Container(
              padding: const EdgeInsets.all(25),
              child: const InkWell(
                child: Center(
                    child: Text(
                  '    ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: GREY),
                )),
              ),
            ),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String? text;
  final ValueSetter<String>? onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTextInput?.call(text!);
      },
      child: Container(
        decoration: BoxDecoration(
          color: GREY1.withOpacity(0.5),
          shape: BoxShape.circle,
          border: Border.all(color: GREY1, width: 2),
        ),
        padding: const EdgeInsets.all(25),
        child: InkWell(
          child: Center(
              child: Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: GREY),
          )),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key? key,
    this.onBackspace,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback? onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onBackspace?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: GREY1.withOpacity(0.5),
          shape: BoxShape.circle,
          border: Border.all(color: GREY1, width: 2),
        ),
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: Icon(Icons.backspace_outlined, size: 20, color: GREY),
        ),
      ),
    );
  }
}
