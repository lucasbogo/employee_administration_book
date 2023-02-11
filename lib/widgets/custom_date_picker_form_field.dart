import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class CustomDatePickerFormField extends StatelessWidget {
  final TextEditingController _controller;
  final String _txtLable;
  final VoidCallback _callback;

  const CustomDatePickerFormField({
    Key? key,
    required TextEditingController controller,
    required String txtLable,
    required VoidCallback callback,
  })  : _controller = controller,
        _txtLable = txtLable,
        _callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(_txtLable),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _callback,
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$_txtLable não pode ser vazio';
        }
        return null;
      },
      onTap: _callback,
    );
  }
}
