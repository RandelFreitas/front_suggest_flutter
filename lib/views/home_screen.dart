import 'package:flutter/material.dart';
import 'package:suggest/stores/company_store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final company = CompanyStore();

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }

  _getDrawerItem(int pos) {
    switch (pos) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuggestInBox'),
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
            ExpansionTile(
              leading: Icon(Icons.description),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [],
            ),
            ExpansionTile(
              leading: Icon(Icons.alt_route),
              title: Text(
                'Suggests',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [],
            ),
            ExpansionTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Configurações',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [],
            ),
          ],
        ),
      ),
      body: ElevatedButton(
        child: Text("Teste"),
        onPressed: () {
          company.getCompanies();
        },
      ),
    );
  }
}
