import 'package:flutter/material.dart';

class AdaptableListTile extends StatelessWidget {
  //const AdaptableListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx,index){
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: FittedBox(
                  child: Text('Anything'),
                ),
              ),
            ),
            title: Text('List Tile Title'),
            subtitle: Text(' The subtitle'),
            trailing: MediaQuery.of(context).size.width > 460
                ? TextButton(onPressed: () {}, child: Text('Text'))
                : IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
          );
        },
      ),
    );
  }
}
