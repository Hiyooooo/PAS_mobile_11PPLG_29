import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/models/product_model.dart';
import 'package:pas_moobile_11pplg_29/network/client_network.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse("${ClientNetwork.baseURLV1}/products"),
    );

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Gagal ambil product: ${response.statusCode}');
    }
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final result = await getProducts();
      products.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
