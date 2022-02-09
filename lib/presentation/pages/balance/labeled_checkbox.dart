import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () {
          onChanged(!value);
        },
        child: Padding(
          padding: padding,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                label,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color:
                        Theme.of(context).primaryTextTheme.titleLarge!.color),
              )),
              Checkbox(
                value: value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                checkColor: Theme.of(context).indicatorColor,
                onChanged: (bool? newValue) {
                  onChanged(newValue!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
