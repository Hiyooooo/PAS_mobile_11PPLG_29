import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';
import 'package:pas_moobile_11pplg_29/database/db_product.dart';
import 'package:pas_moobile_11pplg_29/models/product_model.dart';
import 'package:pas_moobile_11pplg_29/network/client_network.dart';

class ProductController extends GetxController {
  final isLoading = false.obs;
  final products = <ProductModel>[].obs;

  final favoriteIds = <int>{}.obs;

  final db = DbProduct();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    loadFavorites();
  }

  void loadFavorites() async {
    final ids = await db.getFavoriteIds();
    favoriteIds.clear();
    favoriteIds.addAll(ids);
    favoriteIds.refresh();
  }

  void fetchProducts() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse("${ClientNetwork.baseURLV1}/products"),
      );

      if (response.statusCode == 200) {
        final result = productModelFromJson(response.body);
        products.assignAll(result);
      } else {
        Get.snackbar('Error', 'Gagal ambil product: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool isFavorite(int id) => favoriteIds.contains(id);

  void toggleFavorite(int id) async {
    final currentlyFav = isFavorite(id);

    if (currentlyFav) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
    favoriteIds.refresh();

    await db.setFavorite(id, !currentlyFav);

    Get.snackbar(
      "Product Information",
      "Success Added To Favorite",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.surface,
      duration: Duration(seconds: 1),
    );
  }

  void removeFavorite(int id) async {
    favoriteIds.remove(id);
    favoriteIds.refresh();
    await db.setFavorite(id, false);

    Get.snackbar(
      "Product Information",
      "Success Added To Favorite",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.surface,
      duration: Duration(seconds: 1),
    );
  }

  List<ProductModel> get favoriteProducts =>
      products.where((p) => favoriteIds.contains(p.id)).toList();
}
