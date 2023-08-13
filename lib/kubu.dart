import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'http_helper.dart';
import 'kecamatan.dart';
import 'pro.dart';

class Kabkota extends StatefulWidget {
  final Prov kubu;
  final String id;
  const Kabkota(this.kubu, this.id, {super.key});

  @override
  State<Kabkota> createState() => _KabkotaState();
}

class _KabkotaState extends State<Kabkota> {
  late List kota;
  late int kotaCount;
  late HttpHelper helper;
  late String idKab = widget.id;

  bool isLoading = true;

  @override
  void initState() {
    helper = HttpHelper();
    getKab(idKab);
    super.initState();
  }

  Future getKab(id) async {
    setState(() {
      isLoading = true;
    });

    kota = [];
    kotaCount = 0;
    helper = HttpHelper();
    await helper.geKabKota(id).then((result) {
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
        title: const Text('Kubu/Kota'),
      ),
      body: ListView.builder(
        itemCount:  isLoading ? 10 : kotaCount,
        itemBuilder: (BuildContext context, int position) {

          return Card(
            color: Colors.white,
            elevation: 2,
            child: isLoading
                  ? shimmerWidget()
                  : ListTile(
                    onTap: () {
                      String id = kota[position].id.toString();
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => Kecamatan(
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