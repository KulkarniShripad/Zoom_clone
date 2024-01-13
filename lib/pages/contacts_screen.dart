import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:test/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact>? contacts;

  getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );
      print(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: (contacts) == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: contacts!.length,
              itemBuilder: (BuildContext context, int index) {
                Uint8List? image = contacts![index].photo;
                String num = contacts![index].phones.isNotEmpty
                    ? contacts![index].phones.first.number
                    : "--";
                return ListTile(
                  leading: (contacts![index].photo == null)
                      ? const CircleAvatar(
                          child: Icon(Icons.person),
                        )
                      : CircleAvatar(
                          backgroundImage: MemoryImage(image!),
                        ),
                  title: Text(
                    "${contacts![index].name.first} ${contacts![index].name.last}",
                  ),
                  subtitle: Text(num),
                  onTap: () {
                    if (contacts![index].phones.isNotEmpty) {
                      launch("tel = ${num}");
                    }
                  },
                );
              }),
    );
  }
}
