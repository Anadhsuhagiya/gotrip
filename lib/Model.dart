import 'package:shared_preferences/shared_preferences.dart';

class Model {


  static SharedPreferences? prefs;

  static List<String> car_name = [
    'BMW 7 Series',
    'Fortuner Leg.',
    'XUV700',
    'Mercedes-Benz',
    'Range Rover',
    'Discovery',
    'Rolls Royce',
    'Tesla',
    'Volvo',
    'Audi',
    'Porsche',
    'Lexus',
    'Ferrari',
    'Jeguar',
    'Bugatti',
    'Aston Martin',
  ];

  static List<String> car_images = [
    'images/bmw.png',
    'images/fortuner.png',
    'images/xuv700.png',
    'images/benz.png',
    'images/RR.png',
    'images/discovery.png',
    'images/roll_royce.png',
    'images/tesla.png',
    'images/volvo.png',
    'images/audi.png',
    'images/porsche.png',
    'images/lexus.png',
    'images/ferrari.png',
    'images/jeguar.png',
    'images/buggati.png',
    'images/aston_martin.png',
  ];

  static List<String> car_price = [
    '\$ 106,800',
    '\$ 93,500',
    '\$ 79,800',
    '\$ 102,100',
    '\$ 157,600',
    '\$ 110,300',
    '\$ 650,000',
    '\$ 540,000',
    '\$ 230,000',
    '\$ 104,000',
    '\$ 467,000',
    '\$ 234,000',
    '\$ 674,000',
    '\$ 397,000',
    '\$ 1,965,000',
    '\$ 436,000',
  ];

  static List<String> car_description = [
    '○ ARAI Mileage  :  39.53 kmpl\n○ Engine Displacement (cc)  :  2998\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  46.0\n○ Fuel Type  :  Petrol\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  10.52 kmpl\n○ Engine Displacement (cc)  :  2755\n○ Seating Capacity  :  7\n○ Fuel Tank Capacity  :  80.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.19 kmpl\n○ Engine Displacement (cc)  :  2198\n○ Seating Capacity  :  7\n○ Fuel Tank Capacity  :  60.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.90 kmpl\n○ Engine Displacement (cc)  :  1991\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  66.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  39.53 kmpl\n○ Engine Displacement (cc)  :  2998\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  46.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  10.52 kmpl\n○ Engine Displacement (cc)  :  2755\n○ Seating Capacity  :  7\n○ Fuel Tank Capacity  :  80.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.19 kmpl\n○ Engine Displacement (cc)  :  2198\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  60.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.90 kmpl\n○ Engine Displacement (cc)  :  1991\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  66.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  39.53 kmpl\n○ Engine Displacement (cc)  :  2998\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  46.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  10.52 kmpl\n○ Engine Displacement (cc)  :  2755\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  80.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.19 kmpl\n○ Engine Displacement (cc)  :  2198\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  60.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.90 kmpl\n○ Engine Displacement (cc)  :  1991\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  66.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  39.53 kmpl\n○ Engine Displacement (cc)  :  2998\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  46.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  10.52 kmpl\n○ Engine Displacement (cc)  :  2755\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  80.0\n○ Fuel Type  :  Petrol\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.19 kmpl\n○ Engine Displacement (cc)  :  2198\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  60.0\n○ Fuel Type  :  Diesel\n○ TransmissionType  :  Automatic',
    '○ ARAI Mileage  :  17.90 kmpl\n○ Engine Displacement (cc)  :  1991\n○ Seating Capacity  :  4\n○ Fuel Tank Capacity  :  66.0\n○ Fuel Type  :  Petrol\n○ TransmissionType  :  Automatic',
  ];


  static List<String> Category = [
    'https://cdn-icons-png.flaticon.com/512/4830/4830734.png',
    'https://cdn-icons-png.flaticon.com/512/2072/2072317.png',
    'https://cdn-icons-png.flaticon.com/512/669/669969.png',
    'https://cdn-icons-png.flaticon.com/512/3990/3990804.png',
    'https://cdn-icons-png.flaticon.com/512/2465/2465370.png',
    'https://cdn-icons-png.flaticon.com/512/281/281631.png',
    'https://cdn-icons-png.flaticon.com/512/5190/5190782.png',
    'https://cdn-icons-png.flaticon.com/512/3194/3194570.png',
    'https://cdn-icons-png.flaticon.com/512/740/740803.png',
    'https://cdn-icons-png.flaticon.com/512/5593/5593690.png',
    'https://cdn-icons-png.flaticon.com/512/7385/7385434.png',
    'https://cdn-icons-png.flaticon.com/512/777/777242.png',
    'https://cdn-icons-png.flaticon.com/512/2200/2200326.png',
  ];

  static List<String> Category_Name = [
    'Countries',
    'Mountains',
    'Beach',
    'Clubs',
    'Forts',
    'Hotels',
    'Zoo',
    'Forest',
    'Deserts',
    'Water Park',
    'Fun Park',
    'Movies',
    'Flights',
  ];

  static List<String> offers = [
    'https://promos.makemytrip.com/images/dh-tb-mb-261222.jpg',
    'https://promos.makemytrip.com/images/aa-homestay-rajasthan-tb-mb-151222.webp',
    'https://promos.makemytrip.com/images/vietnam-htl-tb-mb-061222.webp',
    'https://promos.makemytrip.com/images/gt-tb-mb-151222.webp',
    'https://promos.makemytrip.com/images/Vistara-df-tb-mb-231222.webp',
    'https://promos.makemytrip.com/images/960x640-lemontree-19122022.jpg',
    'https://promos.makemytrip.com/images/affordable-tb-mb-191022.webp',
    'https://promos.makemytrip.com/images/ancillaryMeals-tb-mb-010922.webp',
    'https://promos.makemytrip.com/images/excessBaggage-tb-mb-050922.webp',
    'https://promos.makemytrip.com/images/honeymoon-tb-mb-new-25112021.webp',
  ];

  static List<String> Story_photos = [
    'https://www.yanaluxury.com/img/hotels/1462/big/232/1694747004.jpg',
    'https://i.pinimg.com/originals/75/73/ad/7573ad441ac40df3f671621034a2b02f.jpg',
    'https://tripnxt.com/blog/wp-content/uploads/2020/02/TripNxt-Taj-Mahal.jpg',
    'https://i.pinimg.com/736x/06/a6/81/06a681190411e45737746ccbf0d51003--burj-khalifa-united-arab-emirates.jpg',
    'https://i.pinimg.com/originals/86/ad/c5/86adc5c951a01a1ce89ec44015bee2c6.jpg',
    'https://wallpapercave.com/wp/wp10591039.jpg', // Manhattan Bridge , usa
    'https://dunham-bush.com/wp-content/uploads/2019/12/Londan-Eye.jpg', // london eye
    'https://i.imgflip.com/1vfh32.jpg', // big ben
    'https://avatars.mds.yandex.net/i?id=1c96723e6199e02868ced70616e69c3d_l-5244093-images-thumbs&ref=rim&n=13&w=1024&h=683', // london bridge
    'https://4kwallpapers.com/images/wallpapers/eiffel-tower-paris-france-evening-purple-sky-lights-iconic-2048x1536-2978.jpg', // Eiffel Tower
    'https://lovinghoneymoons.com/us/wp-content/uploads/2017/07/01-3.jpg', // India Gate
    'https://pixy.org/src/3/38951.jpg', // mumbai Gate
    'https://pbs.twimg.com/media/D4bJCj2UUAIS0Dg.jpg:large', // Hotel Taj
  ];

  static List<String> Story_Title = [
    'Burj Al Arab , Dubai',
    'Crescent Moon Tower',
    'Taj Mahal , India',
    'Burj Khalifa , Dubai',
    'Statue of Liberty , USA',
    'Manhattan Bridge , USA',
    'London Eye , UK',
    'Big Ben , UK',
    'Tower Bridge , London',
    'Eiffel Tower , France',
    'The India Gate , India',
    'The Gateway of India',
    'The Taj Hotel , India',
  ];
}
