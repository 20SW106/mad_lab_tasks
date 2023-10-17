import 'package:flutter/material.dart';
import 'package:whatsapp_ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text('WhatsApp'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text('Chats'),
                ),
                Tab(
                  child: Text('Status'),
                ),
                Tab(
                  child: Text('Call'),
                ),
              ],
            ),
            actions: [
              const Icon(Icons.search),
              const SizedBox(width: 10,),
              PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: '1',
                      child: Text('New Group'),
                    ),
                    PopupMenuItem(
                      value: '2',
                      child: Text('Settings'),
                    ),
                    PopupMenuItem(
                      value: '3',
                      child: Text('Log Out'),
                    ),
                  ]
              ),
              SizedBox(width: 10,)
            ],
          ),
          body: TabBarView(
            children: [
              Text('Camera'),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg'),
                      ),
                      title: Text('WhatsApp User'),
                      subtitle: Text('Hey There! I am using WhatsApp.'),
                      trailing: Text('6:36 PM'),
                    );
                  }
              ),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    if (index == 0){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('New Updates'),
                            ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.green,
                                    )
                                ),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg'),
                                ),
                              ),
                              title: Text('WhatsApp User'),
                              subtitle: Text('Hey There! I am using WhatsApp.'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('New Updates'),
                            ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.green,
                                    )
                                ),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg'),
                                ),
                              ),
                              title: Text('WhatsApp User'),
                              subtitle: Text('Hey There! I am using WhatsApp.'),
                            ),
                          ],
                        ),
                      );
                    }

                  }
              ),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg'),
                      ),
                      title: Text('WhatsApp User'),
                      subtitle: Text(index /2 == 0? 'You Missed Call Audio Call' : 'Call times is 12:23'),
                      trailing: Icon(index /2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }
              ),
            ],
          ),
        ));
  }
}
