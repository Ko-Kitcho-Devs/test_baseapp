

import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'injection_container.dart' as di; 
import 'src/presentation/app.dart'; 


Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
