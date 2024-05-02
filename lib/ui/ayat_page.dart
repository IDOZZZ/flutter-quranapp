// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/common/contants.dart';
import 'package:flutter_ahlul_quran_app/cubit/Ayat/ayat_cubit.dart';


import 'package:flutter_ahlul_quran_app/ui/data/model/surah_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AyatPage extends StatefulWidget {
  const AyatPage({
    Key? key,
    required this.surah,
  }) : super(key: key);
  final SurahModel surah;


  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AyatCubit>().getDetailSurah(widget.surah.nomor);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          ' Surah ${widget.surah.namaLatin}',
          style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        backgroundColor: AppColors.blue,
        centerTitle: true,
      ),
      body: BlocBuilder<AyatCubit, AyatCubitState>(
        builder: (context, state) {
          if (state is AyatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AyatLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ayat = state.detail.ayat![index];


                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.blue,
                      child: Text(
                        '${ayat.nomor}',
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                    title: Text(
                      '${ayat.ar}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('${ayat.idn}'),
                  ),
                );
              },
              itemCount: state.detail.ayat!.length,
            );
          }


          if (state is AyatError) {
            return Center(
              child: Text(state.message),
            );
          }


          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}





