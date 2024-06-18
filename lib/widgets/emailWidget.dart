import 'package:flutter/material.dart';
import '../model/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onDismissed;

  EmailWidget({
    required this.email,
    required this.onTap,
    required this.onLongPress,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Dismissible(
        key: Key(email.id.toString()),
        onDismissed: (direction) {
          onDismissed();
        },
        background: Container(color: const Color.fromARGB(255, 247, 210, 207)),
        child: ListTile(
         trailing: email.read ?  Icon(Icons.mark_email_read) : Icon(Icons.mark_email_unread),
          title: Text(email.subject),
          subtitle: Text(email.from),
          onTap: onTap,
        ),
      ),
    );
  }
}
