import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.onChange,
      //  required this.prefixIcon,
      this.hintText = "",
      this.isPassword = false,
      required this.label,
      this.isPin = false});

  final Function(String value) onChange;
  // final IconData prefixIcon;
  final String hintText;
  final bool isPassword;
  final String label;
  final bool isPin;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, bottom: 4),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: TextField(
              cursorColor: Colors.black,
              keyboardType:
                  widget.isPin ? TextInputType.number : TextInputType.text,
              obscureText: !showPassword && widget.isPassword,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 1.5),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.5),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  //prefixIcon: Icon(widget.prefixIcon),
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            /* Clear the search field */
                            setState(() {
                              showPassword = !showPassword;
                            });
                            print("change");
                          },
                        )
                      : Container(
                          width: 10,
                        ),
                  hintText: widget.hintText,
                  hintStyle:  TextStyle(color: Colors.grey.shade300),
                  //  labelText: widget.label,
                  labelStyle:  TextStyle(color: Colors.grey.shade300)),
              onChanged: widget.onChange,
            ),
          ),
        ),
      ],
    );
  }
}
