import 'package:amar_wallet/core/app_icons.dart';
import 'package:amar_wallet/module/global_widget/custom_icon_button.dart';
import 'package:amar_wallet/module/search/controller/searc_bloc.dart';
import 'package:amar_wallet/module/search/controller/search_event.dart';
import 'package:amar_wallet/module/search/controller/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc? _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    _searchBloc?.add(GetCardListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: TextField(
          onChanged: (value) {
            _searchBloc?.add(SearchCardEvent(value)); 
          },
          decoration: InputDecoration(
              hintText: "Search loyalty programmes",
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              suffixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100))),
        ),
        actions: [
          CustomIconButton(onTap: () {}, icon: AppIcons.filterIcon),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
              itemCount: state.searchCardList.length,
              itemBuilder: (context, index) {
                var card = state.searchCardList[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(card.image),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            card.title,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            card.type,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ))
                    ],
                  ),
                );
              }),
        );
      }),
    );
  }
}
