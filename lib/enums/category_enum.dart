import 'package:news_app/gen/assets.gen.dart';

enum CategoryEnum {
  general,
  business,
  sport,

  health,
  entertainment,

  technology,
  science;

  String get getImage {
    switch (this) {
      case CategoryEnum.business:
        return Assets.images.busniess.path;
      case CategoryEnum.general:
        return Assets.images.general.path;
      case CategoryEnum.entertainment:
        return Assets.images.entertainment.path;
      case CategoryEnum.health:
        return Assets.images.health.path;
        ;
      case CategoryEnum.science:
        return Assets.images.science.path;
      case CategoryEnum.sport:
        return Assets.images.sport.path;
        ;
      case CategoryEnum.technology:
        return Assets.images.technology.path;
    }
  }
}
