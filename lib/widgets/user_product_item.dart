import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

// ignore: must_be_immutable
class UserProductItem extends StatelessWidget {
  String id;
  String title;
  String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            },
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Provider.of<Products>(context, listen: false).deleteProduct(id);
            },
            color: Theme.of(context).colorScheme.error,
          ),
        ]),
      ),
    );
  }
}
