import 'package:flutter/material.dart';
import 'package:flutter_future/models/profile_model.dart';
import 'package:flutter_future/services/service_data.dart';

class PerfilPage extends StatefulWidget {
  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late Future<ProfileModel> persona1Future;
  ServiceData serviceData = ServiceData();

  @override
  void initState() {
    super.initState();
    persona1Future = serviceData.getSpecificProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<ProfileModel>(
            future: persona1Future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                ProfileModel persona1 = snapshot.data!;
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff272727),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                persona1.image,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(width: 16), // Espaciado entre imagen y texto
                              Expanded( // Ajustar el espacio restante
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${persona1.fullName}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ), 
                                    Text(
                                      "${persona1.profesion}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Color(0xff424242),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: persona1.socialList.map((e) => 
                                              Expanded(
                                                child: Text(
                                                  e.titulo,
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ).toList(),
                                          ),
                                          Row(
                                            children: persona1.socialList.map((e) => 
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    e.value.toString(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción del primer botón
                                    },
                                    child: Text('Chat'),
                                    style: ElevatedButton.styleFrom(
                                     backgroundColor: Color(0xff272727),
                                     shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.white, width: 1.0), // Color del borde
                                  ),
                                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción del segundo botón
                                    },
                                    child: Text('Follow',style: TextStyle(color: Colors.white),),
                                    style: ElevatedButton.styleFrom(
                                     backgroundColor: Color(0xff00D6A0),
                                       shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                        side: BorderSide(color: Colors.white, width: 1.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Information",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(persona1.information),
                    ...persona1.pendientesList.map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          leading: Image.network(e.imageUrl),
                          title: Text(e.titulo),
                          subtitle: Text(e.description),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ).toList(),
                  ],
                );
              }
              return Center(
                child: Text('No data found'),
              );
            },
          ),
        ),
      ),
    );
  }
}
