import 'package:fitri_ambarwati_3202116103/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'kubu.dart';

class Wilayah extends StatefulWidget {
  const Wilayah({super.key});

  @override
  State<Wilayah> createState() => _WilayahState();
}

class _WilayahState extends State<Wilayah> {
  late List provinsi;
  late int provinsiCount;
  late HttpHelper helper;

  bool isLoading = true;

  Future initialize() async {
    setState(() {
      isLoading = true;
    });

    provinsi = [];
    provinsiCount = 0;

    await helper.getProvinsi().then((result) {
      
      setState(() {
      provinsiCount = result.length;
      provinsi = result;
      isLoading = false;
    });
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Icity'),
      ),
      body: ListView.builder(
        itemCount: isLoading ? 10 : provinsiCount,
        itemBuilder: (BuildContext context, int position) {

          return Card(
            color: Colors.white,
            elevation: 2,
            child: isLoading
                  ? shimmerWidget()
                  : ListTile(
                    onTap: () {
                      String id = provinsi[position].id.toString();
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => Kabkota(
                          provinsi[position], id
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    
                    title: Text(provinsi[position].name),
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