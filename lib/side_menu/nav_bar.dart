import 'package:flutter/material.dart';
import 'package:student_info/screens/cs.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Mekdes Merga"),
            accountEmail: const Text("mekdesmerga19@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                    "DRAWER_AND_MENUS/assets/image/IMG_20220302_062636_318.jpg"),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () => print("profile clicked"),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("setting"),
            onTap: () => print("setting clicked"),
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Help"),
            onTap: () => print("Help clicked"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("About Developer"),
            onTap: () => print("About developer clicked"),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("LogOut"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cs()));
            },
          )
        ],
      ),
    );
  }
}
