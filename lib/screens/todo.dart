import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenTodo extends StatefulWidget {
  const ScreenTodo({super.key});

  @override
  State<ScreenTodo> createState() => ScreenTodoState();
}

class ScreenTodoState extends State<ScreenTodo> {
  final TextEditingController taskController = TextEditingController();
  List <String> task = [];
  bool isOn = false;

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        backgroundColor: const Color.fromARGB(80, 0, 4, 255),
        leading: Image.asset('assets/images/pngegg (15).png'),
        actions:  [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(onPressed: (){
              showAboutDialog(context: context,applicationName: 'Todo List',
              applicationIcon: Image.asset('assets/images/pngegg (15).png',width: 50,height: 50,),
              applicationVersion: 'version: 1.0.0+1',
              children: [
                const SizedBox(height: 10,),
                const Text('Developed by '),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse('https://abhinavpradeep.vercel.app'));
                    
                    
                    
                  },
                  child: const Text('Abhinav Pradeep',style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,),
                  
                )


              )]
              );
              





            }, icon: Icon(Icons.fax_rounded)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  "Add your Do'S",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromARGB(255, 55, 0, 255),
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your Task',
                        hintText: 'here',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.task),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        task.add(taskController.text);
                        taskController.clear();

                      });
                      
                      
                    },
                    
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: 
              ListView.builder(
              itemCount : task.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(task[index]),
                    leading: Checkbox(value: isOn, onChanged:
                    (value){
                      setState(() {
                      isOn = value!;
                      });


                    } ),
                     trailing: IconButton(onPressed: (){
                      setState(() {
                        task.removeAt(index);
                      });

                     }, icon: Icon(Icons.delete)) ,
                     
                  ),
                );
              }))

              
            ],
          ),
        ),
      ),
      
    );
    
  }
}
