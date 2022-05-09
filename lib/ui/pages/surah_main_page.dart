import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:quran_app/theme.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:quran_app/ui/pages/surah_ayat_tab.dart';
import 'package:quran_app/ui/pages/surah_tafsir_tab.dart';
import 'package:quran_app/ui/widgets/custom_appbar_widget.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({Key? key}) : super(key: key);

  @override
  State<SurahPage> createState() => _HomePageState();
}

class _HomePageState extends State<SurahPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return CustomAppBarWidget(
        title: 'surah name',
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: defaultMargin,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  appBar(),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffCB94E8),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: -10,
                            blurRadius: 15,
                            inset: true,
                            offset: const Offset(3, 3),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: -12,
                            blurRadius: 15,
                            inset: true,
                            offset: const Offset(-3, -3),
                          ),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TabBar(
                            unselectedLabelColor: whiteColor,
                            labelColor: const Color(0xff975BFE),
                            indicatorWeight: 1,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                              color: whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff616161).withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                                BoxShadow(
                                  color:
                                      const Color(0xff616161).withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            controller: tabController,
                            tabs: [
                              Tab(
                                child: Text(
                                  'Surah',
                                  style: txRegular.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                height: 40,
                              ),
                              Tab(
                                child: Text(
                                  'Tafsir',
                                  style: txRegular.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        const SurahAyatTab(),
                        const SurahTafsirTab(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
