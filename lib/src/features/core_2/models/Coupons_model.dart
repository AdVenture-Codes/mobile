import 'package:cloud_firestore/cloud_firestore.dart';

class CouponModel {
  final String? id, name, vendor, code, gift, url;

  CouponModel({
    this.id,
    this.name,
    this.vendor,
    this.code,
    this.gift,
    this.url,
  });

  CouponModel setCouponId(String IdCoupon) {
    return CouponModel(
      id: IdCoupon,
      name: this.name,
      vendor: this.vendor,
      code: this.code,
      gift: this.gift,
      url: this.url,
    );
  }

  toJson() {
    return {
      "id": id,
      "name": name,
      "vendor": vendor,
      "code": code,
      "gift": gift,
      "url": url
    };
  }

  factory CouponModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CouponModel(
        id: document.id,
        name: data["name"],
        vendor: data["vendor"],
        code: data["code"],
        gift: data["gift"],
        url: data["url"]);
  }
}

List<CouponModel> coupons = [
  CouponModel(
      name: "Money",
      vendor: "Zara",
      code: "6570",
      gift: "5dt",
      url: "https://www.zara.com/tn/"),
  CouponModel(
      name: "Gift",
      vendor: "Bershka",
      code: "9588",
      gift: "-50%",
      url: "https://www.bershka.com/tn/"),
  CouponModel(
      name: "Gift",
      vendor: "PULL&BEAR",
      code: "9585",
      gift: "-30%",
      url: "https://www.pullandbear.com/"),
  CouponModel(
      name: "Money",
      vendor: "Zara",
      code: "6990",
      gift: "5dt",
      url: "https://www.zara.com/tn/"),
  CouponModel(
      name: "Gift",
      vendor: "Bershka",
      code: "9388",
      gift: "-50%",
      url: "https://www.bershka.com/tn/"),
  CouponModel(
      name: "Gift",
      vendor: "PULL&BEAR",
      code: "5728",
      gift: "-30%",
      url: "https://www.pullandbear.com/"),
];
