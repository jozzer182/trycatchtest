import 'dart:developer';
import 'package:flutter/material.dart';

// Creamos una clave global para acceder al NavigatorState
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  // // Desactivar los mensajes de error predeterminados de Flutter
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   debugPrint('FlutterError capturado: ${details.exceptionAsString()}');
    
  //   // Mostrar un diálogo para los errores no capturados en try-catch
  //   if (navigatorKey.currentContext != null) {
  //     showErrorDialog('Error no capturado', details.exceptionAsString());
  //   }
  // };

  runApp(const MainApp());
}

// Función para mostrar diálogo de error desde cualquier parte de la app
void showErrorDialog(String title, String errorMessage) {
  if (navigatorKey.currentContext != null) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  } else {
    debugPrint('No se pudo mostrar el diálogo: contexto no disponible');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // Asignamos la clave global al navegador
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Try-Catch Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            try {
              throw Exception('Este es un error de prueba al presionar el botón');
            } catch (e) {
              showErrorDialog('Error Capturado', 'Error capturado: $e');
            }
          },
          child: const Text('Probar Try-Catch'),
        ),
      ),
    );
  }
}
