import 'package:clasetopicosuno/producto.dart';
import 'package:flutter/material.dart';

class VerProductos extends StatelessWidget {
  final List<Producto> productos;
  const VerProductos({
    super.key,
    required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 243, 247),
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Color.fromRGBO(143, 240, 253, 1),
        foregroundColor: Colors.grey.shade800,
      ),
      body: ListView(
        children: productos
            .map(
              (e) => Container(           
                child: Column(           
                  children: [

                    DataTable(
                      dividerThickness: 10,
                      dataRowHeight: 50,
                      headingRowHeight: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(14, 212, 225, 231),
                        
                      ),

                      columns: const [
                        DataColumn(
                          label: Text("Codigo"),
                           

                        ),
                        DataColumn(
                          label: Text("Producto")),
                        DataColumn(
                          label: Text("Precio"))
                      ],
                      rows: [
                        
                        DataRow(
                           selected: true,
                          cells: [
                          DataCell(Text(e.codigo)),
                          DataCell(Text(e.nombre)),
                          DataCell(Text(e.precio.toString()))
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
