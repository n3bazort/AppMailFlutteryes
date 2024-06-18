import 'package:flutter/material.dart';
import '../model/backend.dart';
import '../model/email.dart';
import '../widgets/emailWidget.dart';
import 'DetailScreen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final Backend _backend = Backend();
  late List<Email> _emails;

  @override
  void initState() {
    super.initState();
    _emails = _backend.getEmails();
  }

  void _markAsRead(int id) {
    setState(() {
      _backend.markEmailAsRead(id);
    });
  }

  void _deleteEmail(int id) {
    setState(() {
      _backend.deleteEmail(id);
      _emails = _backend.getEmails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buzón de Emails Josué'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.separated(
        itemCount: _emails.length,
        itemBuilder: (context, index) {
          final email = _emails[index];
          return EmailWidget(
            email: email,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(email: email),
                ),
              ).then((_) {
                _markAsRead(email.id);
              });
            },
            onLongPress: () {
              _markAsRead(email.id);
            },
            onDismissed: () {
              _deleteEmail(email.id);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
