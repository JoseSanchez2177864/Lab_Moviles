import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AmenidadesPage extends StatelessWidget {
  final String title;
  final String subtitle;

  const AmenidadesPage({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/residente');
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AmenidadCard(
            nombre: "Alberca",
            capacidad: 20,
            horarios: ["10:00 - 12:00", "14:00 - 16:00", "16:00 - 18:00"],
            icon: Icons.pool,
          ),
          SizedBox(height: 16),
          AmenidadCard(
            nombre: "Salón de Eventos",
            capacidad: 50,
            horarios: ["09:00 - 13:00", "14:00 - 18:00", "19:00 - 23:00"],
            icon: Icons.celebration,
          ),
        ],
      ),
    );
  }
}

class AmenidadCard extends StatefulWidget {
  final String nombre;
  final int capacidad;
  final List<String> horarios;
  final IconData icon;

  const AmenidadCard({
    super.key,
    required this.nombre,
    required this.capacidad,
    required this.horarios,
    required this.icon,
  });

  @override
  State<AmenidadCard> createState() => _AmenidadCardState();
}

class _AmenidadCardState extends State<AmenidadCard> {
  int selectedIndex = -1;
  bool expandido = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          // 🔹 Header azul
          Container(
            height: 90,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF1E3A8A)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: Center(
              child: Icon(widget.icon, color: Colors.white, size: 40),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Nombre + estado
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.nombre,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Disponible",
                        style: TextStyle(fontSize: 11, color: Colors.green),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // 🔹 Capacidad
                Row(
                  children: [
                    const Icon(Icons.people, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      "Capacidad: ${widget.capacidad}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // 🔹 Horarios
                const Text(
                  "Horarios disponibles hoy",
                  style: TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  children: List.generate(widget.horarios.length, (index) {
                    final seleccionado = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: seleccionado
                              ? const Color(0xFF1E3A8A)
                              : const Color(0xFFE5EDFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.horarios[index],
                          style: TextStyle(
                            fontSize: 11,
                            color: seleccionado
                                ? Colors.white
                                : const Color(0xFF1E3A8A),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 12),

                // 🔹 Reglamento (expandible)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      expandido = !expandido;
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, size: 14),
                      const SizedBox(width: 6),
                      const Text("Reglamento"),
                      const Spacer(),
                      Icon(
                        expandido
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                    ],
                  ),
                ),

                if (expandido) ...[
                  const SizedBox(height: 6),
                  const Text(
                    "Aquí va el reglamento de la amenidad...",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],

                const SizedBox(height: 14),

                // 🔹 Botón
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: selectedIndex == -1 ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Reservar ${widget.nombre}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
