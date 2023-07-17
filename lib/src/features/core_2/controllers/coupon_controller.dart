import 'package:get/get.dart';
import 'package:verse/src/features/core/controllers/profile_controller.dart';
import 'package:verse/src/features/core_2/models/Coupons_model.dart';
import 'package:verse/src/repository/coupn_repository/coupon_repository.dart';

class couponController extends GetxController {
  static couponController get instance => Get.find();
  final controller = Get.put(ProfileController());

  // repository
  final _couponRepo = Get.put(CouponRepository());
  getCouponData(String idCoupon) {
    if (idCoupon != "") {
      final controller = Get.put(ProfileController());
      final user = controller.getUserData();
      return _couponRepo.getCouponDetails(idCoupon, user.id);
    } else {
      Get.snackbar("Error", "Coupon doesn't exist");
    }
  }

  Future<List<CouponModel>> getAllCoupons() async {
    final controller = Get.put(ProfileController());
    final user = controller.getUserData();
    return await _couponRepo.getAllCoupons(user.id);
  }

  Future<void> createCoupon(CouponModel coupon) async {
    final user = await controller.getUserData();
    await _couponRepo.createCoupon(coupon, user.id);

    //Get.to(page);
  }
}
