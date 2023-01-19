import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Query dbRef =
      FirebaseDatabase.instance.ref().child('proyecto').limitToLast(1);
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('proyecto');
      

  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(25),
      height: 500,
      color: student['alarma'].toString() == '1'
                ? Colors.amberAccent
                : Colors.amberAccent[50]
,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Estado del hogar:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            student['alarma'].toString() == '1'
                ? 'Alerta de incendio'
                : 'Todo está funcionando con normalidad',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            'Ubicacion',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Altitud:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            student['altura'].toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Latitud:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            student['latitud'].toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map student = snapshot.value as Map;
              student['key'] = snapshot.key;

              return listItem(student: student);
            },
          ),
        ));
  }
}
