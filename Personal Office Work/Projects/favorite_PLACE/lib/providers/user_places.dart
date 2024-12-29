import 'dart:io';

import 'package:favorite_place/model/place.dart'; // Ensure this import path
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

Future<Database> _getDataBase() async {
  final dpPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dpPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT,lat REAL,lng REAL,address TEXT)');
    },
    version: 1,
  );

  return db;
}

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final db = await _getDataBase();
    final data = await db.query('user_places');
    final places = data
        .map((row) => Place(
              id: row['id'].toString(),
              title: row['title'].toString(),
              image: File(['image'].toString()),
              location: PlaceLocation(
                latitude: row['lat'] as double,
                longitude: row['lng'] as double,
                address: row['address'] as String,
              ),
            ))
        .toList();
    state = places;
  }

  void addPlace(String title, File image, PlaceLocation? location) async {
    final appDir = await syspaths.getApplicationCacheDirectory();
    final fileName = path.basename(image.path);
    final copyImage = await image.copy('${appDir.path}/$fileName');
    print(copyImage);
    final newPlace = Place(title: title, image: copyImage, location: location!);
    final db = await _getDataBase();
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlaceNotifier, List<Place>>(
  (ref) => UserPlaceNotifier(),
);
