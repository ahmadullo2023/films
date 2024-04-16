import 'package:flutter/material.dart';
import '../screen/save_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text('Drawer Header', style: TextStyle(color: Colors.white))),
          ListTile(
            leading: const Icon(
              Icons.save,
              color: Colors.black
            ),
            title: const Text('Save', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const SavePage()));
            },
          ),
        ],
      ),
    );
  }
}
