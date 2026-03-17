import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:privada/main.dart';

class ResidentePage extends StatefulWidget {
  const ResidentePage({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  State<ResidentePage> createState() => _ResidentePageState();
}

class _ResidentePageState extends State<ResidentePage> {
  String tipoVisita = '';

  Widget circularIcon({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: 20),
    );
  }

  Widget visitaCard({
    required String nombre,
    required String fecha,
    required String estado,
    required bool activa,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: MyApp.cardDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: AppColors.secondaryText,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      fecha,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: activa
                  ? AppColors.lightGreen
                  : AppColors.completedLightGray,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              estado,
              style: TextStyle(
                color: activa
                    ? AppColors.primaryGreen
                    : AppColors.completedGray,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            circularIcon(
              icon: Icons.home,
              iconColor: Colors.white,
              backgroundColor: Colors.white24,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: const TextStyle(fontSize: 18)),
                Text(widget.subtitle, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: const [Icon(Icons.exit_to_app), SizedBox(width: 16)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Estado de Cuotas
              Container(
                padding: const EdgeInsets.all(16),
                decoration: MyApp.cardDecoration().copyWith(
                  border: Border.all(color: AppColors.primaryGreen, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            circularIcon(
                              icon: Icons.check_circle_outline,
                              iconColor: AppColors.primaryGreen,
                              backgroundColor: AppColors.lightGreen,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Estado de Cuotas",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text("Pagar"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "\$0.00 MXN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Al corriente",
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Generar QR
              Container(
                padding: const EdgeInsets.all(16),
                decoration: MyApp.cardDecoration(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        circularIcon(
                          icon: Icons.qr_code_scanner,
                          iconColor: AppColors.primaryBlue,
                          backgroundColor: AppColors.primaryBlue.withOpacity(
                            0.15,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Generar Código QR",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Crea un código QR temporal para tus visitantes",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.secondaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print('Generar QR presionado');
                          mostrarDialogoQR(context, tipoVisita, (nuevaVisita) {
                            setState(() {
                              tipoVisita = nuevaVisita;
                            });
                          });
                        },
                        icon: const Icon(Icons.qr_code_2),
                        label: const Text("Nuevo Visitante"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Reservar Amenidad
              GestureDetector(
                onTap: () {
                  print('Container presionado');
                  context.go('/amenidades');
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: MyApp.cardDecoration(),
                  child: Row(
                    children: [
                      circularIcon(
                        icon: Icons.calendar_today_outlined,
                        iconColor: AppColors.amenityYellow,
                        backgroundColor: AppColors.amenityYellowLight,
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reservar Amenidad",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Ver disponibilidad",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Historial
              Column(
                children: [
                  // Título historial
                  Row(
                    children: const [
                      Icon(Icons.history),
                      SizedBox(width: 8),
                      Text(
                        "Historial de Visitas",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  visitaCard(
                    nombre: "María González",
                    fecha: "2026-02-18 · 14:30",
                    estado: "Activa",
                    activa: true,
                  ),

                  visitaCard(
                    nombre: "Juan Ramírez",
                    fecha: "2026-02-17 · 16:00",
                    estado: "Completada",
                    activa: false,
                  ),

                  visitaCard(
                    nombre: "Carlos Pérez",
                    fecha: "2026-02-15 · 18:10",
                    estado: "Completada",
                    activa: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void mostrarDialogoQR(
  BuildContext context,
  String tipoVisita,
  Function(String) onTipoVisitaChanged,
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      String tipoLocal = tipoVisita; // 🔹 variable local

      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🔹 Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Generar Código QR",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, size: 20),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Nombre
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nombre del visitante",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Ej: María González",
                      filled: true,
                      fillColor: const Color(0xFFF5F7FA),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔹 Fecha
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fecha de visita",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "dd/mm/aaaa",
                      filled: true,
                      fillColor: const Color(0xFFF5F7FA),
                      suffixIcon: const Icon(Icons.calendar_today, size: 18),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔹 Hora
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hora estimada",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "--:-- -----",
                      filled: true,
                      fillColor: const Color(0xFFF5F7FA),
                      suffixIcon: const Icon(Icons.access_time, size: 18),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Tipo de visita
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tipo de visita",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () async {
                      final opcion = await showModalBottomSheet<String>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("Entrada"),
                                  onTap: () =>
                                      Navigator.pop(context, "Entrada"),
                                ),
                                ListTile(
                                  title: const Text("Salida"),
                                  onTap: () => Navigator.pop(context, "Salida"),
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      if (opcion != null) {
                        // 🔹 Actualiza UI del dialog
                        setStateDialog(() {
                          tipoLocal = opcion;
                        });

                        // 🔹 Actualiza estado real
                        onTipoVisitaChanged(opcion);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              tipoLocal.isEmpty
                                  ? "Selecciona una opción"
                                  : tipoLocal,
                              style: TextStyle(
                                fontSize: 14,
                                color: tipoLocal.isEmpty
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down, size: 20),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Botón
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        mostrarQRGeneradoDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A), // azul oscuro
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Generar Código QR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

void mostrarQRGeneradoDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F6F8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🔹 Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Código QR Generado",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 QR (placeholder)
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Center(
                  child: Icon(Icons.qr_code, size: 80, color: Colors.black54),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Info box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEFF2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: const [
                    Text(
                      "maria",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "2023-02-11 • 13:32",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, size: 14, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          "Válido por 30 min",
                          style: TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 Texto
              const Text(
                "Comparte este código con tu visitante",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),

              const SizedBox(height: 20),

              // 🔹 Botones
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          // lógica compartir
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Compartir",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cerrar",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
