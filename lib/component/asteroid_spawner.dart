import 'dart:async';
import 'dart:math' as math;

import 'package:dasar_flame/component/asteroid.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class AsteroidSpawner extends PositionComponent with HasGameRef {
  late SpawnComponent spawner;

  @override
  FutureOr<void> onLoad() {
    math.Random r = math.Random();
    spawner = SpawnComponent(
      factory: (idx) {
        //factory= pabrik, properti yg digunakan utk membuat spam component baru(asteroid)
        return Asteroid(ukuran: r.nextDouble() * 0.3 + 0.1);
      },
      period: 0.5,
      autoStart: true,
      area: Rectangle.fromLTWH(0, 0, game.size.x,
          game.size.y), //jarak penambahan spawn komponen baru, dlm satuan detik
      within: false, //membuat asteroid muncul dipinggir2 sj
    );

    game.add(spawner);
    return super.onLoad();
  }
}
