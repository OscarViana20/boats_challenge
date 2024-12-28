class BoatModel {
  String model;
  String author;
  String path;
  BoatModel({
    this.model,
    this.author,
    this.path
  });
}

final boats = [
  BoatModel(model: 'X22 Lift', author:'Mastercraft', path: 'assets/images/boat1.png'),
  BoatModel(model: 'X24 Fun', author:'Mastercraft', path: 'assets/images/boat2.png'),
  BoatModel(model: 'X24 Force', author:'Neokraft', path: 'assets/images/boat3.png'),
  BoatModel(model: 'X24 Reload', author:'Neokraft', path: 'assets/images/boat4.png'),
  BoatModel(model: 'X25 Fun', author:'Mastercraft', path: 'assets/images/boat5.png'),
];