import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'http_helper.dart';
import 'pro.dart';

class Kelurahan extends StatefulWidget {
  final Kec kel;
  final String id;
  const Kelurahan(this.kel, this.id, {super.key});

  @override
  State<Kelurahan> createState() => _KelurahanState();
}

class _KelurahanState extends State<Kelurahan> {
  late List kota;
  late int kotaCount;
  late HttpHelper helper;
  late String idKab = widget.id;

  bool isLoading = true;

  @override
  void initState() {
    helper = HttpHelper();
    getKel(idKab);
    super.initState();
  }

  Future getKel(id) async {
    setState(() {
      isLoading = true;
    });

    kota = [];
    kotaCount = 0;
    helper = HttpHelper();
    await helper.getKelurahan(id).then((result) {
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
        title: const Text('Kelurahan'),
      ),
      body: ListView.builder(
        itemCount: isLoading ? 10 : kotaCount,
        itemBuilder: (BuildContext context, int position) {

          return Card(
            color: Colors.white,
            elevation: 2,
            child: isLoading
                  ? shimmerWidget()
                  :ListTile(
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