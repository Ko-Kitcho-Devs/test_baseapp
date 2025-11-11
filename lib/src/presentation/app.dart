

import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart'; 


import '../../injection_container.dart'; 
import '../application/user/users_bloc.dart'; 
import '../application/user/users_event.dart'; 
import '../presentation/user/users_list_page.dart'; 


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
         
          create: (_) {
            final bloc = sl<UsersBloc>(); // résout UsersBloc via GetIt
            bloc.add(LoadUsers());       // <-- déclenche l' event : LoadUsers()
            return bloc;                
          },
        ),
      ],
      child: MaterialApp(
        title: 'BaseApp users crud', 
        debugShowCheckedModeBanner: false, 
        theme: ThemeData(
          primarySwatch: Colors.blue, 
        ),
        
        home: const UsersListPage(),
      ),
    );
  }
}
