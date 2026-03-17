import 'package:go_router/go_router.dart';
import 'package:privada/Pages/amenidades.dart';
import 'package:privada/Pages/residente.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/residente',
  routes: [
    GoRoute(
      path: '/residente',
      name: 'residente',
      builder: (context, state) => const ResidentePage(
        title: "Casa #201",
        subtitle: "Hola, Roberto García",
      ),
    ),

    GoRoute(
      path: '/amenidades',
      name: 'amenidades',
      builder: (context, state) => const AmenidadesPage(
        title: "Amenidades",
        subtitle: "Reserva espacios comunes",
      ),
    ),
  ],
);
