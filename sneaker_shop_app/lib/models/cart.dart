import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> ShoeShop = [
    Shoe(
        name: 'Adidas Mens Adistar',
        Imagepath: 'lib/images/Adidas Mens Adistar.jpg',
        price: '240',
        description:
            'INSPIRADO NA VELOCIDADE E PROJETADO PARA A CULTURA DA RAPIDEZ'),
    Shoe(
        name: 'Adidas Mens ClimaCool',
        Imagepath: 'lib/images/Adidas Mens ClimaCool.jpg',
        price: '2150',
        description: 'PARA CORRER COM PERFORMANCE E LEVEZA'),
    Shoe(
        name: 'Adidas Mens Revenergy',
        Imagepath: 'lib/images/Adidas Mens Revenergy.jpg',
        price: '300',
        description: 'TÊNIS LEVE PARA CORRIDAS DE LONGA DISTÂNCIA'),
    Shoe(
        name: 'Adidas Womens Revenergy',
        Imagepath: 'lib/images/Adidas Womens Revenergy.jpg',
        price: '260',
        description:
            'TÊNIS DE TREINO RÁPIDO COM TECNOLOGIA DE ALTO DESEMPENHO'),
  ];
  List<Shoe> ShoeCart = [];
  List<Shoe> getShoeShop() {
    return ShoeShop;
  }

  List<Shoe> getShoeCart() {
    return ShoeCart;
  }

  void addItemToCart(Shoe shoe) {
    ShoeCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    ShoeCart.remove(shoe);
    notifyListeners();
  }
}
