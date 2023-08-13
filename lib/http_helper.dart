import 'dart:convert';
import 'dart:io';

import 'package:fitri_ambarwati_3202116103/pro.dart';
import 'package:http/http.dart';

class HttpHelper {
  final String urlProvinsi = 'https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json';
  final String urlKabKota = 'https://emsifa.github.io/api-wilayah-indonesia/api/regencies/';
  final String urlKecamatan = 'https://emsifa.github.io/api-wilayah-indonesia/api/districts/';
  final String urlKelurahan = 'https://emsifa.github.io/api-wilayah-indonesia/api/villages/';
  final String urlEnd = '.json';
  
  Future<List> getProvinsi() async {
    final String upcoming = urlProvinsi;
    print(upcoming);
    Response result = await get(Uri.parse(upcoming));
    print(result.statusCode);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final provinsiMap = jsonResponse;
      List provinsi = provinsiMap.map((i) => Prov.fromJson(i)).toList();
      return provinsi;
    } else {
      //print('False: $result.statusCode');
      return [];
    }
  }
  Future<List> geKabKota(String idKab) async {
    final String upcoming = urlKabKota + idKab + urlEnd;
    Response result = await get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final KabkotaMap = jsonResponse;
      List kabkota = KabkotaMap.map((i) => Kab.fromJson(i)).toList();
      return kabkota;
    } else {
      return [];
    }
  }
  Future<List> getKecamatan(String idKec) async {
    final String upcoming = urlKecamatan + idKec + urlEnd;
    Response result = await get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final KecamatanMap = jsonResponse;
      List kecamatan = KecamatanMap.map((i) => Kec.fromJson(i)).toList();
      return kecamatan;
    } else {
      return [];
    }
  }
  Future<List> getKelurahan(String idKel) async {
    final String upcoming = urlKelurahan + idKel + urlEnd;
    Response result = await get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final KelurahanMap = jsonResponse;
      List kelurahan = KelurahanMap.map((i) => Kel.fromJson(i)).toList();
      return kelurahan;
    } else {
      return [];
    }
  }

  


}