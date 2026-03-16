import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  static const primaryBlue = Color(0xFF2F5DAA);
  static const darkBlue = Color(0xFF243E8F);

  static const primaryGreen = Color(0xFF23B26D);
  static const lightGreen = Color(0xFFE6F7EF);

  static const background = Color(0xFFF4F6F9);
  static const card = Colors.white;

  static const primaryText = Color(0xFF1E1E1E);
  static const secondaryText = Color(0xFF7A7A7A);

  static const amenityYellow = Color(0xFFF4B740);
  static const amenityYellowLight = Color(0xFFFFF4DB);

  static const completedGray = Color(0xFF9E9E9E);
  static const completedLightGray = Color(0xFFF1F3F5);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Casa #201";
  final String subtitle = "Hola, Roberto García";

  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: MyHomePage(title: title, subtitle: subtitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

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
                Text(title, style: const TextStyle(fontSize: 18)),
                Text(subtitle, style: const TextStyle(fontSize: 12)),
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
                        onPressed: () {},
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
              Container(
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
