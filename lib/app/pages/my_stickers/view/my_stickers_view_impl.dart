import 'package:dartweek_fwc/app/core/ui/helpers/loader.dart';
import 'package:dartweek_fwc/app/core/ui/helpers/messages.dart';
import 'package:dartweek_fwc/app/models/group_stickers_model.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/my_stickers_page.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:flutter/material.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage>
    with Loader<MyStickersPage>, Messages<MyStickersPage>
    implements MyStickersView {
  var album = <GroupStickersModel>[];
  var filterStatus = 'all';
  var countries = <String, String>{};

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      widget.presenter.getMyAlbum();
    });
    super.initState();
  }

  @override
  void error(String message) => showError(message);

  @override
  void loadPage(List<GroupStickersModel> album) {
    hideLoader();
    setState(
      () {
        this.album = album;
        countries = {
          for (var c in album) c.countryCode: c.countryName,
        };
      },
    );
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      filterStatus = status;
    });
  }

  @override
  void updateAlbum(List<GroupStickersModel> album) {
    hideLoader();
    setState(() {
      this.album = album;
    });
  } 
}
