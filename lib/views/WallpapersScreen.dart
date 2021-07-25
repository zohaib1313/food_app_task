import 'dart:ffi';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_application/view_models/WallpaperScreenViewModel.dart';
import 'package:provider/provider.dart';

class WallpaperScreen extends StatelessWidget {
  final random = Random(100);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<WallpaperScreenViewModel>(context, listen: false);
    vm.getWallpapers(1);
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          Consumer<WallpaperScreenViewModel>(builder: (context, model, child) {
        return RefreshIndicator(
          onRefresh: () => refreshList(model),
          child: Stack(
            alignment: Alignment.center,
            children: [
              StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: model.listOfImages.length,
                itemBuilder: (BuildContext context, int index) => GridTile(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: model.listOfImages[index].src.portrait,
                          fit: BoxFit.cover,
                          useOldImageOnUrlChange: false,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        // child: Image.network(
                        //   model.listOfImages[index].src.portrait,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ),
                ),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 4 : 2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              Visibility(
                child: Center(child: CircularProgressIndicator()),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: model.isLoading,
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<Void> refreshList(WallpaperScreenViewModel model) async {
    return await model.refreshList("image_cache_info");
  }
}
