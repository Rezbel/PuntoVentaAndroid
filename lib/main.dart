import 'package:clasetopicosuno/producto.dart';
import 'package:clasetopicosuno/Ventanas/crear_producto.dart';
import 'package:clasetopicosuno/Ventanas/ver_productos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());

await Hive.initFlutter();

  var box = await Hive.openBox('myBox');
  List<Map<String, dynamic>> productos = [
    {
      'id': 1,
      'codigo': '34402304',
      'nombre': 'Coca',
      'precio': 18,
    },
    {
      'id': 2,
      'codigo': '454544',
      'nombre': 'Pepsi',
      'precio': 19,
    }
  ];
  box.put('productos', productos);
  List<dynamic> info = box.get('productos');
  print(info[1]['nombre']);
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.title = '',
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  TextEditingController codigoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  bool errorNombre = false;
  List<Producto> productos = [];
  
  get child => null;





  @override
  Widget build(BuildContext context) {


    return Scaffold(//Contorno de la aplicacion
      body: Center(
        child: Stack(//Cuerpo de la aplicacion
          children:  [       
            
            Container (
              width: 720,
              height: 1080,
              color: Color.fromARGB(255, 156, 220, 231),
              child: CustomPaint(
          painter: _midiseno(),
              ),
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
              children: [


                const SizedBox(
                  height: 100,
                ),


                   const Center(
                    child: Text(
                      'Punto Venta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white
                    )
                  ),
                  ),


                  const SizedBox(
                  height: 70,
                ),


                Image.asset('assets/imagen.png'),
                const SizedBox(
                  height: 50 ,
                ),


                //Boton de crear producto
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                    fontSize: 20,
                    ),
                    backgroundColor: Colors.teal.shade300,
                    shape: const StadiumBorder(),
                    elevation: 10,
                    shadowColor: Color.fromARGB(255, 87, 130, 133),
                    minimumSize: Size(230, 60)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CrearProducto();
                        },
                      ),
                    ).then(
                      (value) {
                        // String codigo = value['codigo'];
                        // String nombre = value['nombre'];
                        // double precio = double.parse(value['precio']);
                        if (value != null) productos.add(value);
                      },
                    );
                  },
                  child: Text('Crear Producto'),
                ),



          const SizedBox(
                  height: 40,
                ),


                //Boton de ver producto
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                    fontSize: 20,                  
                    ),
                    backgroundColor: Color.fromARGB(255, 112, 165, 214),
                    shape: StadiumBorder(),
                    elevation: 10,
                    shadowColor: Color.fromARGB(255, 87, 130, 133),
                    minimumSize: Size(230, 60)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return VerProductos(
                            productos: productos,
                          );
                        },
                      ),
                    );
                  },
                  child: Text('Ver Productos'),
                ),


              ],
            ),
            
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}


class _midiseno extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
    
    //Propiedades
    ..color=Color.fromRGBO(0, 188, 212, 1)
    ..style=PaintingStyle.fill
    ..strokeWidth=5.0
        ..strokeCap=StrokeCap.round;

    final path = Path();
    //dibujar el lapiz y el path
  
    path.lineTo(0, size.height*0.2);
    path.quadraticBezierTo(size.width*0.5, size.height*0.3, size.width*1 , size.height*0.20);
    //path.quadraticBezierTo(size.width*0.85, size.height*0.27, size.width, size.height*0.25);
    
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw false;
  }

  
}