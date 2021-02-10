import 'package:flutter/material.dart';
import 'package:suggest/stores/auth_store.dart';
import 'package:suggest/stores/company_store.dart';
import 'package:suggest/views/suggest_screen.dart';

import 'company_screen.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedIndex = 'dashboard';
  final company = CompanyStore();
  final auth = AuthStore();

  _onSelectItem(String index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }

  _getDrawerItem(String pos) {
    switch (pos) {
      case 'dashboard':
        return DashboardScreen();
      case 'suggests':
        return SuggestScreen();
      case 'companies':
        return CompanyScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuggestInBox'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Configurações',
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                auth.logout();
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text("Suggest"),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                _onSelectItem('dashboard');
              },
            ),
            ListTile(
              leading: Icon(Icons.alt_route),
              title: Text(
                'Suggests',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                _onSelectItem('suggests');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Configurações',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                _onSelectItem('companies');
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItem(_selectedIndex),
    );
  }
}
