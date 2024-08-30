import 'package:equatable/equatable.dart';

class MapMarkerModel extends Equatable {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final String img;
  final String address;

  MapMarkerModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.img,
    required this.address,
  });

  factory MapMarkerModel.fromJson(dynamic data) {
    return MapMarkerModel(
      id: data['id'],
      name: data['name'],
      lat: data['lat'],
      lng: data['lng'],
      img: data['img'],
      address: data['address'],
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        lat,
        lng,
        img,
        address,
      ];
}

const List<dynamic> mapMarkersData = [
  {
    "id": "Kai1",
    "lat": 55.797048,
    "lng": 49.114148,
    "name": "Первое здание",
    "img": "https://gge.ru/upload/iblock/1ec/kai2.jpg",
    "address": "ул. Карла Маркса, 10\nОстановка КАИ",
  },
  {
    "id": "Kai2",
    "lat": 55.822680,
    "lng": 49.136085,
    "name": "Второе здание",
    "img": "https://pbs.twimg.com/media/Dg7rJalXkAAMg09.jpg:large",
    "address":
        "ул. Четаева, 18\n(пересечение улиц Четаева и Амирхана)\nОстановка ул. Четаева",
  },
  {
    "id": "Kai3",
    "lat": 55.792372,
    "lng": 49.137514,
    "name": "Третье здание",
    "img":
        "https://upload.wikimedia.org/wikipedia/commons/2/2d/%D0%9A%D0%9D%D0%98%D0%A2%D0%A3-%D0%9A%D0%90%D0%98%2C_3-%D0%B5_%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5.jpg",
    "address": "ул. Льва Толстого, 15\nОстановка ул.Л.Толстого",
  },
  {
    "id": "Kai4",
    "lat": 55.793131,
    "lng": 49.137397,
    "name": "Четвертое здание",
    "img": "https://art16.ru/gallery2/d/899825-3/dsc08768.jpg",
    "address": "ул. Горького, 28/17\nОстановка ул.Л.Толстого",
  },
  {
    "id": "Kai5",
    "lat": 55.797139,
    "lng": 49.124183,
    "name": "Пятое здание",
    "img": "https://kartarf.ru/images/heritage/1080/7/71061.jpg",
    "address": "ул. Карла Маркса, 31/7\nОстановка Площадь Свободы",
  },
  {
    "id": "Kai6",
    "lat": 55.854229,
    "lng": 49.098060,
    "name": "Шестое здание",
    "img":
        "https://kai.ru/documents/10181/5714768/6+%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5.jpg/138cdf1e-640c-4f6d-8ca8-d6335507507e?t=1484826009897",
    "address": "ул. Дементьева, 2а\nОстановка Институт",
  },
  {
    "id": "Kai7",
    "lat": 55.796941,
    "lng": 49.133849,
    "name": "Седьмое здание",
    "img": "https://pbs.twimg.com/media/DioKW-EX0AATjNu.jpg:large",
    "address": "ул. Большая Красная, 55\nОстановка Гоголя",
  },
  {
    "id": "Kai8",
    "lat": 55.820845,
    "lng": 49.135951,
    "name": "Восьмое здание",
    "img":
        "https://vuzyi.lancmanschool.ru/assets/blog/images/%D0%9A%D0%9D%D0%98%D0%A2%D0%A3%D0%9A%D0%90%D0%98.jpg",
    "address": "ул. Четаева, 18а\nОстановка Чистопольская",
  },
  {
    "id": "KaiOlimp",
    "lat": 55.820243,
    "lng": 49.139490,
    "name": "КАИ Олимп",
    "img":
        "https://i1.photo.2gis.com/images/branch/21/2955487284540671_3282.jpg",
    "address": "Чистопольская ул., 65А\nОстановка Чистопольская",
  },
];
