import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/features/core_2/models/Coupons_model.dart';

import '../../features/authentification/models/user_model.dart';

class CouponRepository extends GetxController {
  static CouponRepository get instace => Get.find();
  final _db = FirebaseFirestore.instance;
  createCoupon(CouponModel coupon, String idUser) async {
    final docCoupon = _db.collection("coupons").doc(idUser);
    coupon = coupon.setCouponId(docCoupon.id);
    await docCoupon
        .set(coupon.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Check Your Coupons.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((e) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  Future<CouponModel> getCouponDetails(String idCoupon, String idUser) async {
    final snapshot = await _db
        .collection("coupons")
        .doc()
        .collection(idUser)
        .where("id", isEqualTo: idCoupon)
        .get();

    final couponData =
        snapshot.docs.map((e) => CouponModel.fromSnapshot(e)).single;
    return couponData;
  }

  Future<List<CouponModel>> getAllCoupons(String idUser) async {
    final snapshot =
        await _db.collection("coupons").doc().collection(idUser).get();
    final couponData =
        snapshot.docs.map((e) => CouponModel.fromSnapshot(e)).toList();
    return couponData;
  }
}
