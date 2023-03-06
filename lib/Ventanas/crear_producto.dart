import 'package:clasetopicosuno/producto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrearProducto extends StatefulWidget {
  CrearProducto({super.key});

  @override
  State<CrearProducto> createState() => _CrearProductoState();
}

class _CrearProductoState extends State<CrearProducto> {
  final TextEditingController codigoController = TextEditingController();

  final TextEditingController nombreController = TextEditingController();

  final TextEditingController precioController = TextEditingController();

  bool _error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [


            Container (
              width: 720,
              height: 1080,
              color: Color.fromARGB(255, 221, 243, 247),
              child: CustomPaint(
          painter: _midiseno(),
              ),
            ),

            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),


             
               Text(
                'Productos',
                textAlign: TextAlign.left,
                style: 
                GoogleFonts.montserrat(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
                  letterSpacing: 3,
                ),
              ),



              const SizedBox(
                height: 70,
              ),


              TextField(
                controller: codigoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Código',
                ),
              ),


              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                  errorText: _error ? 'tu texto esta mal' : null,
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.contains('s'))
                      _error = true;
                    else
                      _error = false;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),


              TextField(
                controller: precioController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Precio',
                ),
              ),


              const SizedBox(
                height: 30,
              ),



              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    Producto(
                        codigo: codigoController.text,
                        nombre: nombreController.text,
                        precio: double.parse(precioController.text)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,                  
                    ),
                    backgroundColor: Color.fromARGB(255, 113, 140, 170),
                    shape: StadiumBorder(),
                    elevation: 10,
                    shadowColor: Color.fromARGB(255, 55, 64, 65),
                    minimumSize: Size(150, 60)
                  ),
                child: const Text('Guardar'),
              ),

              const SizedBox(
                width: 25 
                ),


              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,    
                    color: Colors.black            
                    ),
    
                    backgroundColor: Color.fromRGBO(69, 137, 146, 1),
                    shape: StadiumBorder(),
                    elevation: 10,
                    shadowColor: Color.fromARGB(255, 55, 64, 65),
                    minimumSize: Size(150, 60)
                  ),
                child: const Text('Cancelar'),
              ),

              ],

              ),
              
              
              ],
            ),
            ],
          
        ),
      ),
    );
  }
}

class _midiseno extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()

      //Propiedades
      ..color = Color.fromRGBO(143, 240, 253, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    final path = Path();
    //dibujar el lapiz y el path

    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.3, size.width * 1,
        size.height * 0.20);
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
