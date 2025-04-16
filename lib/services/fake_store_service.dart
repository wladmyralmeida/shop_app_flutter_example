import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app_flutter/models/product_model.dart';

/// Serviço para consumir a Fake Store API
class FakeStoreService {
  final String _baseUrl = 'https://fakestoreapi.com';

  /// Lista todos os produtos
  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar produtos');
    }
  }

  /// Busca um produto pelo ID
  Future<Product> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao buscar produto');
    }
  }

  /// Lista as categorias disponíveis
  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/products/categories'));
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao buscar categorias');
    }
  }

  /// Busca produtos por categoria
  Future<List<Product>> fetchProductsByCategory(String category) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/products/category/$category'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar produtos da categoria');
    }
  }
}
