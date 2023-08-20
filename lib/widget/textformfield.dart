import 'package:flutter/material.dart';


class TextFormFieldWidget extends StatelessWidget {
  TextEditingController Product = TextEditingController();
  TextEditingController Price = TextEditingController();
  final int index;
  final Function(TextFormFieldWidget) removeForm;

  TextFormFieldWidget(this.removeForm, {super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.all(8.0),
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: TextFormField(
                  controller: Product,
                  decoration: const InputDecoration(
                      labelText: 'Product Name', border: OutlineInputBorder()),
                ),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: TextFormField(
                  controller: Price,
                  decoration: const InputDecoration(
                      labelText: 'Price', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                width: 30,
                child: index >= 1 ? IconButton(icon: Icon(Icons.delete_forever), onPressed:(){
                  removeForm(this);
                }) : Text(''),
              )
            ],
          )
        ],
      ),
    );
  }
}