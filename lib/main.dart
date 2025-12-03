import 'package:flutter/material.dart';

void main() {
  runApp(const UxplorerApp());
}

/// APP RAÍZ CON MANEJO DE IDIOMA
class UxplorerApp extends StatefulWidget {
  const UxplorerApp({super.key});

  @override
  State<UxplorerApp> createState() => _UxplorerAppState();
}

class _UxplorerAppState extends State<UxplorerApp> {
  String _language = 'es'; // es, en, fr, pt

  void _setLanguage(String lang) {
    setState(() {
      _language = lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uxplorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE53935),
        ),
        useMaterial3: true,
      ),
      home: WelcomeScreen(
        language: _language,
        onLanguageChanged: _setLanguage,
      ),
    );
  }
}

/// =====================
/// MODELO DE LUGAR
/// =====================

class Place {
  final String id;
  final IconData icon;
  final Color color;
  final int audioMinutes;
  final String busRouteName;
  final int routeDurationMinutes;
  final List<String> busStops;

  const Place({
    required this.id,
    required this.icon,
    required this.color,
    required this.audioMinutes,
    required this.busRouteName,
    required this.routeDurationMinutes,
    required this.busStops,
  });
}

const List<Place> places = [
  Place(
    id: 'times_square',
    icon: Icons.location_city,
    color: Colors.pink,
    audioMinutes: 3,
    busRouteName: 'M7 - Times Sq Loop',
    routeDurationMinutes: 45,
    busStops: [
      'Penn Station',
      'Herald Square',
      'Times Square',
      'Bryant Park',
      'Grand Central',
    ],
  ),
  Place(
    id: 'central_park',
    icon: Icons.park,
    color: Colors.green,
    audioMinutes: 4,
    busRouteName: 'M10 - Central Park Line',
    routeDurationMinutes: 55,
    busStops: [
      'Columbus Circle',
      'Central Park South',
      'Central Park Zoo',
      'Bethesda Terrace',
      'The Met Museum',
    ],
  ),
  Place(
    id: 'statue_liberty',
    icon: Icons.sailing,
    color: Colors.cyan,
    audioMinutes: 5,
    busRouteName: 'M15 + Ferry Battery Park',
    routeDurationMinutes: 70,
    busStops: [
      'Times Square',
      'Union Square',
      'Wall Street',
      'Battery Park',
      'Ferry a Liberty Island',
    ],
  ),
  Place(
    id: 'empire_state',
    icon: Icons.apartment,
    color: Colors.deepPurple,
    audioMinutes: 3,
    busRouteName: 'M4 - Midtown Heritage',
    routeDurationMinutes: 40,
    busStops: [
      'Bryant Park',
      'Times Square',
      'Herald Square',
      'Empire State Building',
      'Koreatown',
    ],
  ),
  Place(
    id: 'brooklyn_bridge',
    icon: Icons.directions_walk,
    color: Colors.orange,
    audioMinutes: 4,
    busRouteName: 'M103 + Cruce del Puente',
    routeDurationMinutes: 60,
    busStops: [
      'Grand Central',
      'Chinatown',
      'City Hall Park',
      'Brooklyn Bridge Entrance',
      'DUMBO Viewpoint',
    ],
  ),
];

/// =====================
/// HELPERS DE TRADUCCIÓN
/// =====================

String tr(
  String lang, {
  required String es,
  required String en,
  required String fr,
  required String pt,
}) {
  switch (lang) {
    case 'en':
      return en;
    case 'fr':
      return fr;
    case 'pt':
      return pt;
    case 'es':
    default:
      return es;
  }
}

String placeTitle(String id, String lang) {
  switch (id) {
    case 'times_square':
      return tr(
        lang,
        es: 'Times Square',
        en: 'Times Square',
        fr: 'Times Square',
        pt: 'Times Square',
      );
    case 'central_park':
      return tr(
        lang,
        es: 'Central Park',
        en: 'Central Park',
        fr: 'Central Park',
        pt: 'Central Park',
      );
    case 'statue_liberty':
      return tr(
        lang,
        es: 'Estatua de la Libertad',
        en: 'Statue of Liberty',
        fr: 'Statue de la Liberté',
        pt: 'Estátua da Liberdade',
      );
    case 'empire_state':
      return tr(
        lang,
        es: 'Empire State Building',
        en: 'Empire State Building',
        fr: 'Empire State Building',
        pt: 'Empire State Building',
      );
    case 'brooklyn_bridge':
      return tr(
        lang,
        es: 'Puente de Brooklyn',
        en: 'Brooklyn Bridge',
        fr: 'Pont de Brooklyn',
        pt: 'Ponte do Brooklyn',
      );
    default:
      return id;
  }
}

String placeShortDescription(String id, String lang) {
  switch (id) {
    case 'times_square':
      return tr(
        lang,
        es: 'Luces, pantallas y el corazón de Broadway.',
        en: 'Lights, big screens and the heart of Broadway.',
        fr: 'Lumières, écrans géants et cœur de Broadway.',
        pt: 'Luzes, telões e o coração da Broadway.',
      );
    case 'central_park':
      return tr(
        lang,
        es: 'El pulmón verde de Manhattan.',
        en: 'The green lung of Manhattan.',
        fr: 'Le poumon vert de Manhattan.',
        pt: 'O pulmão verde de Manhattan.',
      );
    case 'statue_liberty':
      return tr(
        lang,
        es: 'El símbolo de la libertad en la bahía de Nueva York.',
        en: 'The symbol of freedom in New York Harbor.',
        fr: 'Le symbole de la liberté dans la baie de New York.',
        pt: 'O símbolo da liberdade na baía de Nova York.',
      );
    case 'empire_state':
      return tr(
        lang,
        es: 'Un clásico rascacielos con vistas espectaculares.',
        en: 'Classic skyscraper with stunning views.',
        fr: 'Gratte-ciel classique avec vue spectaculaire.',
        pt: 'Arranha-céu clássico com vistas incríveis.',
      );
    case 'brooklyn_bridge':
      return tr(
        lang,
        es: 'Un paseo icónico entre Manhattan y Brooklyn.',
        en: 'Iconic walk between Manhattan and Brooklyn.',
        fr: 'Promenade emblématique entre Manhattan et Brooklyn.',
        pt: 'Passeio icônico entre Manhattan e Brooklyn.',
      );
    default:
      return '';
  }
}

String placeLongDescription(String id, String lang) {
  // Para simplificar, el texto largo está en español en todos los idiomas.
  switch (id) {
    case 'times_square':
      return 'Times Square es una de las plazas más famosas del mundo. '
          'Aquí se cruzan teatros de Broadway, restaurantes y pantallas gigantes que nunca se apagan.';
    case 'central_park':
      return 'Central Park es el gran parque urbano de Nueva York. '
          'Entre sus lagos, puentes y senderos, es el lugar perfecto para descansar de la ciudad.';
    case 'statue_liberty':
      return 'La Estatua de la Libertad fue un regalo de Francia a Estados Unidos y '
          'se ha convertido en un símbolo de bienvenida para millones de inmigrantes.';
    case 'empire_state':
      return 'El Empire State Building fue durante años el edificio más alto del mundo. '
          'Su mirador ofrece una de las vistas más impresionantes de la ciudad.';
    case 'brooklyn_bridge':
      return 'El Puente de Brooklyn conecta Manhattan con Brooklyn desde 1883. '
          'Caminarlo al atardecer es una de las experiencias clásicas de la ciudad.';
    default:
      return '';
  }
}

/// =====================
/// PANTALLA DE BIENVENIDA
/// =====================

class WelcomeScreen extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;

  const WelcomeScreen({
    super.key,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final title = tr(
      language,
      es: 'Uxplorer',
      en: 'Uxplorer',
      fr: 'Uxplorer',
      pt: 'Uxplorer',
    );

    final subtitle = tr(
      language,
      es: 'Tu guía de audio para explorar Nueva York\nusando buses públicos.',
      en: 'Your audio guide to explore New York\nusing public buses.',
      fr: 'Votre guide audio pour explorer New York\nen utilisant les bus publics.',
      pt: 'Seu guia de áudio para explorar Nova York\nusando ônibus públicos.',
    );

    final buttonText = tr(
      language,
      es: 'Comenzar',
      en: 'Start',
      fr: 'Commencer',
      pt: 'Começar',
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.directions_bus_filled,
                  size: 80,
                  color: Colors.redAccent,
                ),
                const SizedBox(height: 24),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LanguageScreen(
                          language: language,
                          onLanguageSelected: (lang) {
                            onLanguageChanged(lang);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(language: lang),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// =====================
/// PANTALLA: SELECCIÓN DE IDIOMA
/// =====================

class LanguageScreen extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguageSelected;

  const LanguageScreen({
    super.key,
    required this.language,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final title = tr(
      language,
      es: 'Elige tu idioma',
      en: 'Choose your language',
      fr: 'Choisissez votre langue',
      pt: 'Escolha seu idioma',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Español'),
            subtitle: const Text('Spanish'),
            trailing: language == 'es'
                ? const Icon(Icons.check, color: Colors.redAccent)
                : null,
            onTap: () => onLanguageSelected('es'),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('English'),
            subtitle: const Text('Inglés'),
            trailing: language == 'en'
                ? const Icon(Icons.check, color: Colors.redAccent)
                : null,
            onTap: () => onLanguageSelected('en'),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Français'),
            subtitle: const Text('Francés'),
            trailing: language == 'fr'
                ? const Icon(Icons.check, color: Colors.redAccent)
                : null,
            onTap: () => onLanguageSelected('fr'),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Português'),
            subtitle: const Text('Portugués'),
            trailing: language == 'pt'
                ? const Icon(Icons.check, color: Colors.redAccent)
                : null,
            onTap: () => onLanguageSelected('pt'),
          ),
        ],
      ),
    );
  }
}

/// =====================
/// PANTALLA PRINCIPAL
/// =====================

class HomePage extends StatelessWidget {
  final String language;

  const HomePage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    final searchHint = tr(
      language,
      es: 'Buscar lugares turísticos',
      en: 'Search tourist places',
      fr: 'Rechercher des lieux touristiques',
      pt: 'Buscar pontos turísticos',
    );

    final titleText = tr(
      language,
      es: 'Lugares turísticos en Nueva York',
      en: 'Tourist spots in New York City',
      fr: 'Lieux touristiques à New York',
      pt: 'Pontos turísticos em Nova York',
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: const Text('Uxplorer'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra de búsqueda (solo visual)
              TextField(
                decoration: InputDecoration(
                  hintText: searchHint,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                readOnly: true, // en la beta no funciona
              ),
              const SizedBox(height: 20),
              Text(
                titleText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      color: place.color.withOpacity(0.08),
                      child: ListTile(
                        leading: Icon(
                          place.icon,
                          color: place.color,
                          size: 30,
                        ),
                        title: Text(
                          placeTitle(place.id, language),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          placeShortDescription(place.id, language),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PlaceDetailPage(
                                language: language,
                                place: place,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =====================
/// PANTALLA DETALLE DE LUGAR
/// =====================

class PlaceDetailPage extends StatelessWidget {
  final String language;
  final Place place;

  const PlaceDetailPage({
    super.key,
    required this.language,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    final audioLabel = tr(
      language,
      es: 'Duración aproximada del audio:',
      en: 'Approx. audio duration:',
      fr: 'Durée audio approximative :',
      pt: 'Duração aproximada do áudio:',
    );

    final audioMinutesText =
        '$audioLabel ${place.audioMinutes.toString()} min';

    final descriptionTitle = tr(
      language,
      es: 'Descripción',
      en: 'Description',
      fr: 'Description',
      pt: 'Descrição',
    );

    final audioButtonText = tr(
      language,
      es: 'Reproducir audio (beta)',
      en: 'Play audio (beta)',
      fr: 'Lancer l’audio (bêta)',
      pt: 'Reproduzir áudio (beta)',
    );

    final audioSnack = tr(
      language,
      es: 'En esta versión beta el audio aún no está disponible.',
      en: 'In this beta version the audio is not available yet.',
      fr: 'Dans cette version bêta, l’audio n’est pas encore disponible.',
      pt: 'Nesta versão beta o áudio ainda não está disponível.',
    );

    final routeButtonText = tr(
      language,
      es: 'Ver ruta del bus',
      en: 'View bus route',
      fr: 'Voir l’itinéraire du bus',
      pt: 'Ver rota do ônibus',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(placeTitle(place.id, language)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen simulada
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: place.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Icon(
                    place.icon,
                    size: 80,
                    color: place.color,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                descriptionTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                placeLongDescription(place.id, language),
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.timer, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    audioMinutesText,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(audioSnack)),
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: Text(audioButtonText),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BusRoutePage(
                        language: language,
                        place: place,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.directions_bus),
                label: Text(routeButtonText),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =====================
/// PANTALLA RUTA DEL BUS
/// =====================

class BusRoutePage extends StatelessWidget {
  final String language;
  final Place place;

  const BusRoutePage({
    super.key,
    required this.language,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    final title = tr(
      language,
      es: 'Ruta del bus',
      en: 'Bus route',
      fr: 'Itinéraire du bus',
      pt: 'Rota do ônibus',
    );

    final totalDurationLabel = tr(
      language,
      es: 'Duración estimada del recorrido:',
      en: 'Estimated route duration:',
      fr: 'Durée estimée du trajet :',
      pt: 'Duração estimada do percurso:',
    );

    final stopsTitle = tr(
      language,
      es: 'Paradas principales',
      en: 'Main stops',
      fr: 'Arrêts principaux',
      pt: 'Paradas principais',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('$title - ${placeTitle(place.id, language)}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mapa / ruta simulada
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.blueGrey.withOpacity(0.3),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.map,
                    size: 70,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${totalDurationLabel} ${place.routeDurationMinutes.toString()} min',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                place.busRouteName,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Text(
                stopsTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: place.busStops.length,
                  itemBuilder: (context, index) {
                    final stop = place.busStops[index];
                    return ListTile(
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(stop),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
