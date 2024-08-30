import 'package:flutter/material.dart';
import 'package:kai_less/presentation/widgets/general/text_field/mk_text_field.dart';

class GroupTextFieldWidget extends StatefulWidget {
  final String? groupNum;
  final Function(String group) onApplied;
  final ValueNotifier<bool> editController;

  const GroupTextFieldWidget({
    Key? key,
    required this.groupNum,
    required this.onApplied,
    required this.editController,
  }) : super(key: key);

  @override
  _GroupTextFieldWidgetState createState() => _GroupTextFieldWidgetState();
}

class _GroupTextFieldWidgetState extends State<GroupTextFieldWidget> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: widget.editController,
      builder: (context, value, child) {
        if (value) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: MKTextField(
                  hintText: 'Ввдите № группы',
                  textController: textController,
                  keyboardType: TextInputType.number,
                  onSubmitted: widget.onApplied,
                ),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  if (textController.value.text.isNotEmpty) {
                    widget.onApplied(textController.value.text);
                  }
                },
                child: Icon(
                  Icons.check,
                  size: 20,
                ),
              ),
              Spacer()
            ],
          );
        } else {
          return GestureDetector(
            onTap: () {
              widget.editController.value = true;
            },
            child: Row(
              children: [
                Text(
                  'Группа: ${widget.groupNum ?? '????'} ',
                ),
                Icon(
                  Icons.edit,
                  size: 20,
                  color: theme.colorScheme.secondary,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
