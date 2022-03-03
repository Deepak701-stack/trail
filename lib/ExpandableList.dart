import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget{
  @override
  _ExpandableListState createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpansionList>{

  List<Item> _data = generateList(10);

  Widget _buildList(){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
          headerBuilder: (BuildContext context,bool isExpanded){
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Text('Expanded values here'),
          ),
          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThunderBird'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildList(),
        ),
      ),
    );
  }
}

class Item{
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({required this.expandedValue, required this.headerValue, this.isExpanded = false});
}

List<Item> generateList(int num){
  return List.generate(num, (index) {
    return Item(
        headerValue : 'Item $index',
        expandedValue: 'This is item number $index'
    );
  });
}