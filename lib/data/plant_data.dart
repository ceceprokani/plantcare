import '../models/plant.dart';

const List<String> plantCategories = [
  'Semua',
  'Dalam Ruangan',
  'Luar Ruangan',
  'Sukulen',
  'Berbunga',
];

final Plant featuredPlant = Plant(
  id: 7,
  name: 'Monstera Deliciosa',
  category: 'Dalam Ruangan',
  description:
      'Tanaman tropis dengan daun besar berlubang yang ikonik. Tumbuh cepat dan menjadi pusat perhatian di ruangan.',
  image: 'assets/images/monstera.png',
  watering: '1-2 minggu sekali',
  sunlight: 'Terang tak langsung',
  careLevel: 'Mudah',
);

final List<Plant> plantList = [
  Plant(
    id: 1,
    name: 'Calathea',
    category: 'Dalam Ruangan',
    description:
        'Dikenal sebagai tanaman doa karena daunnya menutup di malam hari. Corak daunnya indah dan menyukai udara lembap.',
    image: 'assets/images/calathea-plant.png',
    watering: 'Seminggu sekali',
    sunlight: 'Redup hingga sedang',
    careLevel: 'Sulit',
  ),
  Plant(
    id: 2,
    name: 'Dieffenbachia',
    category: 'Dalam Ruangan',
    description:
        'Tanaman berdaun lebar dengan corak hijau-krem. Getahnya beracun, jadi jauhkan dari anak dan hewan peliharaan.',
    image: 'assets/images/dieffenbachia.png',
    watering: 'Seminggu sekali',
    sunlight: 'Terang tak langsung',
    careLevel: 'Sedang',
  ),
  Plant(
    id: 3,
    name: 'Dracaena',
    category: 'Dalam Ruangan',
    description:
        'Tanaman berdaun panjang yang rimbun dan hijau segar. Tahan kondisi minim cahaya dan membantu menyaring udara.',
    image: 'assets/images/lush-green-dracaena.png',
    watering: '1-2 minggu sekali',
    sunlight: 'Redup hingga terang',
    careLevel: 'Mudah',
  ),
  Plant(
    id: 4,
    name: 'Baby Rubber Plant',
    category: 'Sukulen',
    description:
        'Peperomia berdaun tebal dan mengilap yang menyimpan air. Ukurannya kompak dan cocok untuk meja kerja.',
    image: 'assets/images/baby-rubberplant.png',
    watering: '2-3 minggu sekali',
    sunlight: 'Terang tak langsung',
    careLevel: 'Mudah',
  ),
  Plant(
    id: 5,
    name: 'Spathiphyllum',
    category: 'Berbunga',
    description:
        'Dikenal juga sebagai Peace Lily, berbunga putih elegan. Daunnya akan layu sebagai tanda butuh disiram.',
    image: 'assets/images/spathiphyllum.png',
    watering: 'Seminggu sekali',
    sunlight: 'Redup hingga sedang',
    careLevel: 'Sedang',
  ),
  Plant(
    id: 6,
    name: 'Japanese Boxwood',
    category: 'Luar Ruangan',
    description:
        'Semak berdaun kecil yang rapat dan mudah dibentuk. Cocok untuk pagar hidup atau pot di teras.',
    image: 'assets/images/japanese-boxwood.png',
    watering: 'Seminggu sekali',
    sunlight: 'Matahari langsung',
    careLevel: 'Sedang',
  ),
];
