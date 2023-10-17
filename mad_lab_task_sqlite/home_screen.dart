import 'package:flutter/material.dart';
import 'package:flutter_sqlite/db_handler.dart';
import 'notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DBHelper dbHelper = DBHelper();
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    notesList = dbHelper.getNotesList();
    setState(() {}); // Trigger a rebuild after data is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes SQL'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: notesList,
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {

                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      reverse: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){
                            dbHelper!.update(
                              NotesModel(
                                id: snapshot.data![index].id!,
                                  title: 'First filter note',
                                  age: 11,
                                  description: 'let me talk to you tomorrow',
                                  email: 'fsdfsd'
                              )
                            );
                            setState(() {
                              notesList = dbHelper.getNotesList();
                            });
                          },
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                                color: Colors.red,
                                child: Icon(Icons.delete_forever)
                            ),
                            onDismissed: (DismissDirection direction){
                              setState(() {
                                dbHelper.delete(snapshot.data![index].id!);
                                notesList = dbHelper.getNotesList();
                                snapshot.data!.remove(snapshot.data![index]);
                              });
                            },
                            key: ValueKey<int>(snapshot.data![index].id!),
                            child: Card(
                              child: ListTile(
                                // contentPadding: EdgeInsets.all(0),
                                title: Text(snapshot.data![index].title.toString()),
                                subtitle: Text(snapshot.data![index].description.toString()),
                                trailing: Text(snapshot.data![index].age.toString()),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
                
              }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper.insert(
            NotesModel(
              title: 'Lorem Ipsum',
              age: 12,
              description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              email: 'axiftaj@gmail.com',
            ),
          ).then((value) {
            print('data added');
            notesList = dbHelper.getNotesList();
            setState(() {
              loadData(); // Update notesList after data insertion
            });
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


