import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_test/bloc/spotify_bloc.dart';
import 'package:spotify_test/models/feature_playlists/playlist_item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SpotifyBloc bloc;
  late ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        bloc.add(LoadFeatureListEvent());
      }
    });
    bloc = BlocProvider.of<SpotifyBloc>(context);
    bloc.add(LoadFeatureListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotifyBloc, SpotifyState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.grey.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: state.featureList?.items?.length ?? 0,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4 / 6,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    PlaylistItems item = state.featureList!.items![index];
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: CachedNetworkImage(
                              imageUrl: '${item.images?[0].url}',
                              errorWidget: (context, _, __) => Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 60,
                                  )),
                        ),
                        Text(
                          '${item.description}',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    );
                  },
                ),
              ),
              if (state.stateType == StateType.loading)
                CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
