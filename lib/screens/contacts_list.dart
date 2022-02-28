// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:teste/database/dao/contact_dao.dart';
import 'package:teste/models/contact.dart';
import 'package:teste/screens/contact_form.dart';

class ContactsList extends StatelessWidget {

  
  final ContactDao _dao = ContactDao();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts'),),
      body: FutureBuilder<List<Contact>>(

      future: Future.delayed(Duration(seconds: 1)).then((value) => _dao.findAll()),
    builder: (context, snapshot) {
      switch(snapshot.connectionState){
        //Utilizar quando só precise carregar o future quando clicar 
        case ConnectionState.none :
        break;

        case ConnectionState.waiting :
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Loading')
              ],
            ),
          );
        break;

        //Quando o list já tem dados, mas ainda não terminou o future ex: dowload
        case ConnectionState.active :
        break;

        case ConnectionState.done :
        final contacts = (snapshot.data as List<dynamic>);
        return ListView.builder(
          itemBuilder: (context, index) {
           final Contact contact = contacts[index];
            return _ContactItem(contact);
        },
        itemCount: contacts.length,
      );
        break;
      }
      return Text('Vish');
    },
    ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactForm(),),);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name, style: TextStyle(fontSize: 24.0),),
        subtitle: Text(contact.accountNumber.toString(), style: TextStyle(fontSize: 16.0),),
      ),
    );
  }
}