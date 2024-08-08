import 'package:flutter/material.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';

class FilterCheck extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const FilterCheck({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _FilterCheckState createState() => _FilterCheckState();
}

class _FilterCheckState extends State<FilterCheck> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialValue;
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onChanged(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: _toggleSelection,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      context.theme.colorScheme.onBackground.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(8),
                color: _isSelected
                    ? context.theme.colorScheme.primary
                    : Colors.transparent,
              ),
              child: Icon(
                Icons.check,
                color: _isSelected
                    ? context.theme.colorScheme.onPrimary
                    : Colors.transparent,
                size: 20,
              ),
            ),
            const HorizontalSpace.xSmall(),
            Text(
              widget.label,
              style: context.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
