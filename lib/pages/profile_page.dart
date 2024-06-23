import 'dart:js_interop';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Task> tasks = [
    Task(
        title: 'Ir de compras al super',
        description: 'No te olvides de llevar la lista',
        imageUrl: 'assets/image/supermarket.jpg',
        isCompleted: true),
    Task(
        title: 'Llevar las cosas a la casa del',
        description: 'Son cosas delicadas debes de tener cuidado',
        imageUrl: 'assets/image/delicate_items.jpg',
        isCompleted: true),
    Task(
        title: 'Conseguir comida para las ma...',
        description: 'Deben ser bajo en grasas',
        imageUrl: 'assets/image/food.jpg',
        isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              UserProfileHeader(),
              SizedBox(height: 20),
              UserProfileInfo(),
              SizedBox(height: 20),
              TaskList(tasks: tasks),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/image/profile.jpg'), // Asegúrate de tener una imagen en esta ruta
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tony Stark',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Mecanico'),
            SizedBox(height: 10),
            Row(
              children: [
                _buildStatistic('Articles', '43'),
                SizedBox(width: 10),
                _buildStatistic('Following', '234'),
                SizedBox(width: 10),
                _buildStatistic('Rating', '6.3'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Chat')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: Text('Follow')),
              ],
            ),
          ],
        ),
        Text("Imfo")
        
      ],
    );
  }

  Widget _buildStatistic(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}

class UserProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Stark es un fabricante, genio inventor, héroe y explayboy propietario de Industrias Stark. Al comienzo de la saga, es el principal fabricante de armas para el ejército de los Estados Unidos, hasta que cambia de parecer y redirige su conocimiento técnico hacia la creación de armaduras metalizadas que usa para defenderse de aquellos que amenazan la paz alrededor del mundo.',
      style: TextStyle(fontSize: 16),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks.map((task) => TaskTile(task: task)).toList(),
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(task.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Icon(task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked),
      ),
    );
  }
}

class Task {
  final String title;
  final String description;
  final String imageUrl;
  final bool isCompleted;

  Task({required this.title, required this.description, required this.imageUrl, required this.isCompleted});
}