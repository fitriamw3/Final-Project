import 'package:fitri_ambarwati_3202116103/kelurahan.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'http_helper.dart';
import 'pro.dart';

class Kecamatan extends StatefulWidget {
  final Kab kec;
  final String id;
  const Kecamatan(this.kec, this.id, {super.key});

  @override
  State<Kecamatan> createState() => _KecamatanState();
}

class _KecamatanState extends State<Kecamatan> {
  late List kota;
  late int kotaCount;
  late HttpHelper helper;
  late String idKab = widget.id;

  bool isLoading = true;

  @override
  void initState() {
    helper = HttpHelper();
    getKec(idKab);
    super.initState();
  }

  Future getKec(id) async {
    setState(() {
      isLoading = true;
    });

    kota = [];
    kotaCount = 0;
    helper = HttpHelper();
    await helper.getKecamatan(id).then((result) {
      setState(() {
      kotaCount = result.length;
      kota = result;
      isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kecamatan'),
      ),
      body: ListView.builder(
        itemCount: isLoading ? 10 : kotaCount,
        itemBuilder: (BuildContext context, int position) {

          return Card(
            color: Colors.white,
            elevation: 2,
            child: isLoading
                  ? shimmerWidget()
                  : ListTile(
                    onTap: () {
                      String id = kota[position].id.toString();;
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => Kelurahan(
                          kota[position], id
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    
                    title: Text(kota[position].name),
                  ),
          );
        },
      ),
    );
  }

  Widget shimmerWidget() {
    return ListTile(
      title: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 230,
            height: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}