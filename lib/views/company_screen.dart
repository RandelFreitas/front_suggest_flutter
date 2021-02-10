import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:suggest/stores/company_store.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final company = CompanyStore();

  @override
  void initState() {
    super.initState();
    company.getCompanies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1200),
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12)
            ),
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.topLeft,
                    child: Text("Companhias"),
                  ),
                  Expanded(
                    child: Observer(builder: (_) =>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: company.listCompany.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index){
                            return Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {},
                                child: Container(
                                  width: 300,
                                  height: 100,
                                  child: Center(
                                    child: Text(company.listCompany[index]['name']),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Adicionar companhia',
                child: const Icon(Icons.add),
              ),
            )
          ),
        ),
      ),
    );
  }
}