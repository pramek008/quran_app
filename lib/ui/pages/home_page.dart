import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/all_surah_bloc.dart';
import 'package:quran_app/model/getall_surah_model.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/widgets/card_lastread_widget.dart';
import 'package:quran_app/ui/widgets/surah_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AllSurahModel>? _allSurahCache;
  bool _isSearching = false;
  List<Map<String, dynamic>> _searchResult = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<AllSurahBloc>().add(LoadApiEvent());
    super.initState();
  }

  void _runSearch(String keyword) {
    _searchResult.clear();
    if (keyword.isEmpty) {
      setState(() {});
    }

    _allSurahCache!.forEach((surah) {
      if (surah.name.toLowerCase().contains(keyword.toLowerCase())) {
        _searchResult.add(surah.toJson());
      }
    });

    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return SingleChildScrollView(
        child: Column(
          children: [
            _isSearching
                ? Card(
                    elevation: 3,
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSearching = false;
                            _searchController.clear();
                            _searchResult.clear();
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: greyColor,
                        ),
                      ),
                      title: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search Surah',
                          hintStyle: txRegular.copyWith(
                            color: greyColor,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _runSearch(value);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _searchController.clear();
                          _searchResult.clear();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: greyColor,
                        ),
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Text(
                        'Quran App',
                        style: txBold.copyWith(
                          color: scdPurpleColor,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.search_outlined,
                          color: greyColor,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSearching = true;
                          });
                        },
                      ),
                    ],
                  ),
            _searchResult.isNotEmpty || _searchController.text.isNotEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (context, index) {
                        print(_searchResult[index]['name']);
                        return ListTile(
                          // title: Text(_searchResult[index]['name']),
                          title: SurahTileWidget(
                            AllSurahModel.fromJson(_searchResult[index]),
                            key: ValueKey(_searchResult[index]),
                          ),
                          onTap: () {
                            setState(
                              () {
                                _searchResult.clear();
                                _isSearching = false;
                                _searchController.clear();
                                _runSearch('');
                              },
                            );
                          },
                        );
                      },
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    }

    Widget cardLastRead() {
      return const Padding(
        padding: EdgeInsets.only(
          top: 12,
          bottom: 24,
        ),
        child: CardLastReadWidget(),
      );
    }

    Widget surahList(List<AllSurahModel> allSurah) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: allSurah.length,
        itemBuilder: (context, index) {
          return SurahTileWidget(
            allSurah[index],
            key: ValueKey(allSurah[index]),
          );
        },
      );
    }

    //digunakan untuk mengecek apakah cache allSurah sudah ada atau belum
    //jika sudah ada maka akan langsung menampilkan data yang ada di cache
    if (_allSurahCache != null) {
      // print("Cache is not null");
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  appBar(),
                  _isSearching ? const SizedBox() : cardLastRead(),
                  _isSearching ? const SizedBox() : surahList(_allSurahCache!),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      // print("Cache is null");

      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: SingleChildScrollView(
              child: BlocBuilder<AllSurahBloc, AllSurahState>(
                builder: (context, state) {
                  if (state is AllSurahSucces) {
                    _allSurahCache = state.surahList;
                    return Column(
                      children: [
                        appBar(),
                        _isSearching ? const SizedBox() : cardLastRead(),
                        _isSearching
                            ? const SizedBox()
                            : surahList(_allSurahCache!),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    );
                  } else if (state is AllSurahFailed) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }
  }
}
