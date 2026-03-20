import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:privada/main.dart';

class VigilanteHomePage extends StatelessWidget {
  const VigilanteHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    //Lista estática de nombres
    final movimientos = [
      {'nombre': 'María González', 'casa': '201', 'hora': '14:35', 'tipo': 'entrada'},
      {'nombre': 'Juan Pérez', 'casa': '105', 'hora': '14:20', 'tipo': 'salida'},
      {'nombre': 'Carlos Ramírez', 'casa': '304', 'hora': '13:45', 'tipo': 'entrada'},
      {'nombre': 'Ana López', 'casa': '150', 'hora': '13:30', 'tipo': 'salida'},
      {'nombre': 'Roberto Gómez', 'casa': '112', 'hora': '12:50', 'tipo': 'entrada'},
      {'nombre': 'Lucía Fernández', 'casa': '402', 'hora': '12:15', 'tipo': 'salida'},
      {'nombre': 'Diego Torres', 'casa': '205', 'hora': '11:40', 'tipo': 'entrada'},
      {'nombre': 'Elena Beltrán', 'casa': '301', 'hora': '11:20', 'tipo': 'entrada'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      //APPBAR: barra superior azul en la pantalla
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        //Logo (lado izquierdo)
        leading: Icon(
          Icons.shield,
          color: AppColors.darkBlue,
          size: 30,
        ),
        
        //Título
        title: Column(
          children: [
            Text(
              'Control de Accesos',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Turno activo: 08:00 - 16:00',
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 12
              ),
            ),
          ],
        ),
        
        //Botón de Logout (lado derecho)
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded, color: AppColors.completedGray),
            onPressed: () {
              //Aquí irá la función de regresar al Login
              context.go('/Login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // TÍTULO CENTRAL
          const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Column(
                children: [
                  Icon(
                    Icons.qr_code_scanner_rounded,
                    color: AppColors.darkBlue,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Escaneo de QR",
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Toca un botón para iniciar",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
          ),


          //BOTONES: ENTRADA Y SALIDA
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                // BOTÓN: ENTRADA
                Expanded(
                    child: Container(
                       height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryGreen.withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ), // Decoración general de la app
                      child: InkWell( //Función para que se pueda clickear
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          // Función para abrir la cámara/escáner
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.login_rounded, color: AppColors.primaryGreen, size: 32),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Registrar Entrada",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGreen,
                                  fontSize: 14
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "Acceso permitido",
                              style: TextStyle(color: AppColors.primaryGreen.withOpacity(0.8), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                const SizedBox(width: 15),

                // BOTÓN: SALIDA
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEBEE),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.logout_rounded, color: Colors.red, size: 32),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Registrar Salida",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 14
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Finalizar visita",
                            style: TextStyle(color: Colors.red.withOpacity(0.8), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),



          // LISTA DE ÚLTIMOS MOVIMIENTOS
          //Título de la Sección
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Últimos Movimientos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText
                    ),
              ),
            ),
          ),

          // Lista de Movimientos
          Expanded(
              child: ListView.builder(
                itemCount: movimientos.length,
                itemBuilder: (context, index) {
                  final item = movimientos[index];
                  final esEntrada = item['tipo'] == 'entrada';

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: MyApp.cardDecoration(),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: esEntrada ? AppColors.lightGreen : Colors.red[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        esEntrada ? Icons.arrow_forward : Icons.arrow_back,
                        color: esEntrada ? AppColors.primaryGreen : Colors.red,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      item['nombre']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Casa #${item['casa']}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          esEntrada ? 'Entrada' : 'Salida',
                          style: TextStyle(
                            color: esEntrada ? AppColors.primaryGreen : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          item['hora']!,
                          style: const TextStyle(color: AppColors.secondaryText, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
                },
              ),
          ),
        ],
      ),
    );
  }
}