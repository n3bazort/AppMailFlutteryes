import 'package:flutter/material.dart';
import '../model/email.dart';
class EmailWidget extends StatelessWidget {
  final Email email;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onDismissed;

  const EmailWidget({
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
          focusColor: Color.fromARGB(255, 251, 255, 33),
          leading: email.read ?  Icon(Icons.mark_email_read,color:const Color.fromARGB(255, 218, 218, 218) ) : Icon(Icons.mark_email_unread,color:Colors.red),
          title: Text(email.subject),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(email.from),
              Text(email.dateTime.toString()), 
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
