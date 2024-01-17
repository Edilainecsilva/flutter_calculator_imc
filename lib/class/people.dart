import 'dart:ffi';

class People {
  String _name = "";
  Double _weight = "" as Double;
  Double _height = "" as Double;

  People(String name, Double weight, Double height){
    _name = name;
    _weight = weight;
    _height = height;
  }

  void setName(String name){
    _name = name;
  }

  String getName(){
    return _name;
  }

  void setWeight(Double weight){
    _weight = weight;
  }

  Double getWeight(){
    return _weight;
  }

  void setHeight(Double height){
    _height = height;
  }

  Double getHeight(){
    return _height;
  }

  @override
  String toString(){
    return {"Nome:":_name, "Peso:":_weight, "Altura:": _height}
      .toString();
  }
  
}