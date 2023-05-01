import 'package:flutter/material.dart';

class FilterCheckboxWidget extends StatefulWidget {
  final String label;
  final bool isChecked;
  final Function(bool?) onChanged;

  FilterCheckboxWidget({
    required this.label,
    this.isChecked = false,
    required this.onChanged,
  });

  @override
  _FilterCheckboxWidgetState createState() => _FilterCheckboxWidgetState();
}

class _FilterCheckboxWidgetState extends State<FilterCheckboxWidget> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.label),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
        widget.onChanged(value);
      },
    );
  }
}

class FilterCheckboxListWidget extends StatefulWidget {
  final List<String> options;
  final List<bool> initialValues;
  final Function(List<bool>) onChanged;

  FilterCheckboxListWidget({
    required this.options,
    required this.initialValues,
    required this.onChanged,
  });

  @override
  _FilterCheckboxListWidgetState createState() => _FilterCheckboxListWidgetState();
}

class _FilterCheckboxListWidgetState extends State<FilterCheckboxListWidget> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = List.from(widget.initialValues);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.options.length,
      itemBuilder: (BuildContext context, int index) {
        return FilterCheckboxWidget(
          label: widget.options[index],
          isChecked: values[index],
          onChanged: (bool? value) {
            setState(() {
              values[index] = value!;
            });
            widget.onChanged(values);
          },
        );
      },
    );
  }
}