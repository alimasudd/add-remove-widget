import 'package:flutter/material.dart';
import '../widget/textformfield.dart';

class pageView extends StatefulWidget {
  @override
  _pageViewState createState() => _pageViewState();
}

class _pageViewState extends State<pageView> {
  List<TextFormFieldWidget> dynamicList = [];

  List<String> Price = [];

  List<String>Product = [];

  addDynamic(){
    setState(() {});
    if (dynamicList.length >= 10) {
      return;
    }
    dynamicList.add(TextFormFieldWidget(removeDynamic, index: dynamicList.length,));
  }


  removeDynamic(index){
    setState(() {
      dynamicList.remove(index);
    });
  }

  submitData() {
    Product = [];
    Price = [];
    dynamicList.forEach((widget){
      Product.add(widget.Product.text);
      Price.add(widget.Price.text);
    });
    setState(() {});
    print(Product.length);
  }

  @override
  Widget build(BuildContext context) {

    Widget dynamicTextField = Flexible(
      flex: 2,
      child: ListView.builder(
        itemCount: dynamicList.length,
        itemBuilder: (_, index) => dynamicList[index],
      ),
    );

    Widget result = Flexible(
        flex: 1,
        child: Card(
          child: ListView.builder(
            itemCount: Product.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text("${index + 1} : ${Product[index]}                       ${Price[index]}"),
                    ),
                    Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget submitButton = Container(
      child: ElevatedButton(
        onPressed:
        submitData,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Submit Data'),
        ),
      ),
    );

    return Scaffold(
        body: Container(
            child: Column(
                children: <Widget>[
                  Product.length == 0 ? dynamicTextField : result,
                  submitButton,
                ]
            )),
        floatingActionButton: FloatingActionButton(
            onPressed: addDynamic, child: Icon(Icons.add)));
  }
}