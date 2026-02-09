import 'package:flutter/material.dart';

class MessageValidate extends StatelessWidget {

  const MessageValidate ({
    super.key,
    });
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            "Type ur credit card number",
            style: TextStyle(
              color: colors.onPrimary,
            ),
          ),
        )
      ],
    );
  }    
}
  class MessageExpdate extends StatelessWidget {
    const MessageExpdate ({
      super.key,
    });
     @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            "Type ur exp date",
            style: TextStyle(
              color: colors.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}

class MessageCvv extends StatelessWidget {
    const MessageCvv ({
      super.key,
    });
     @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            "Type ur cvv",
            style: TextStyle(
              color: colors.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}
class MessageName extends StatelessWidget {
    const MessageName ({
      super.key,
    });
     @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            "Type ur name",
            style: TextStyle(
              color: colors.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}