import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_ti_4_malam_a/models/table_resto_model.dart';

class TableRestoList extends StatelessWidget {
  const TableRestoList({super.key});

  Future<List<TableRestoModel>> getTableRestos() async {
    try {
      // 10.0.2.2:8000 = emulator
      // 127.0.1.1:8000 = pc
      var response = await Dio().get('http://10.0.2.2:800/api/table_resto');
      // /*
      // kalau mau ambil smw data response.data['data']
      // */
      debugPrint('Response table resto : ${response.data['data']}');
      if (response.statusCode != 200) {
        throw Exception('Failed fetch data');
      }
      List list = response.data['data'];
      List<TableRestoModel> listTableResto =
          list.map((element) => TableRestoModel.fromJson(element)).toList();
      return listTableResto;
    } on DioException catch (e) {
      throw Exception(e.toString());
      // debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    getTableRestos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Resto List'),
      ),
      body: FutureBuilder<List<TableRestoModel>>(
          future: getTableRestos(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (snapshot.hasData) {
              // var data = snapshot.data;
              List<TableRestoModel> list = snapshot.data;
              debugPrint(list.toString());
              return ListView.separated(itemBuilder: (context, index){
                return ListTile(title: ,)
              })
              // return ListView.separated(
              //   itemBuilder: itemBuilder,
              // )
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          }),
    );
  }
}
