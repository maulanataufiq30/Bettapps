import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  String nama = "NAMA";
  String merek = "MEREK";
  String tipe = "TIPE";
  String detail = "DETAIL";
  String gambar = "GAMBAR";
  String harga = "0";
  String jumlah = "0";
  Timestamp dibuat, terjual;

  /// Menambah Info User ke Cloud Firestore

  Future tambahInfoAkun(
      String userCredential, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential)
        .set(userInfoMap);
  }

  Future tambahFavorit(String namaBarang, userCredential,
      Map<String, dynamic> favoritInfoMap) async {
    return FirebaseFirestore.instance
        .collection("favorit")
        .doc(userCredential)
        .collection('barangFavoriteUser')
        .doc(namaBarang)
        .set(favoritInfoMap);
  }

  Future tambahKeranjang(String namaBarang, userCredential,
      Map<String, dynamic> tambahKeranjangMap) async {
    return FirebaseFirestore.instance
        .collection("keranjang")
        .doc(userCredential)
        .collection('barang')
        .doc(namaBarang)
        .set(tambahKeranjangMap);
  }

  Future checkout(String namaBarang, userCredential,
      Map<String, dynamic> tambahCheckoutMap) async {
    return FirebaseFirestore.instance
        .collection("riwayatPembelian")
        .doc(userCredential)
        .collection('barang')
        .doc(namaBarang)
        .set(tambahCheckoutMap);
  }

  Future updateHargaCheckout(String userCredential,
      Map<String, dynamic> tambahTotalCheckoutMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential)
        .update(tambahTotalCheckoutMap);
  }

  Future updateMinusStok(
      String barangUID, Map<String, dynamic> updateStok) async {
    return FirebaseFirestore.instance
        .collection("barang")
        .doc(barangUID)
        .update(updateStok);
  }

  Future<QuerySnapshot> getUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  Future tambahBarang(namaBarang, Map<String, dynamic> infoBarang) async {
    DocumentReference barang =
        FirebaseFirestore.instance.collection("barang").doc(namaBarang);
    return barang.set(infoBarang);
  }

  getNama(namabarang) {
    return this.nama = namabarang;
  }

  getMerek(merekBarang) {
    return this.merek = merekBarang;
  }

  getTipe(tipeBarang) {
    return this.tipe = tipeBarang;
  }

  getDetail(detailBarang) {
    return this.detail = detailBarang;
  }

  static Future<String> uploadGambar(File imageFIle) async {
    String fileName = basename(imageFIle.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFIle);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }

  getHarga(hargaBarang) {
    return this.harga = hargaBarang;
  }

  getWaktuDibuat(waktuDibuatBarang) {
    return this.dibuat = waktuDibuatBarang;
  }

  getWaktuTerjual(waktuTerjualbarang) {
    return this.terjual = waktuTerjualbarang;
  }

  getJumlah(jumlahBarang) {
    return this.jumlah = jumlahBarang;
  }

}
