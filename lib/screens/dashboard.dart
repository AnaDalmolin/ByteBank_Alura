// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:teste/screens/contacts_list.dart';
import 'package:teste/screens/transactions_list.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/bytebank_logo.png"),
            ),
            Row(
              children: [
                _FeatureItem('Transfer', 
                    Icons.monetization_on,
                    onClick: (){
                      _showContactsList(context);
                    },
                    ),
                _FeatureItem('Transaction Feed', 
                Icons.description,
                onClick: () => _showTransactionList(context),
                ),
              ],
            ),
            
          ],
        ),
      );
  }
}

void _showTransactionList(BuildContext context){
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionsList(),),);
}

void _showContactsList( BuildContext context){
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsList(),),);
}


class _FeatureItem extends StatelessWidget {

  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, { required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
               color: Theme.of(context).primaryColor,
                child: InkWell(
                  onTap: () => onClick(),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: 100,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(icon, color: Colors.white, size: 24,),
                        Text(name, style: TextStyle(color: Colors.white, fontSize: 16.0),)
                      ],
                   )
                  ),
                ),
              ),
            );
  }
}