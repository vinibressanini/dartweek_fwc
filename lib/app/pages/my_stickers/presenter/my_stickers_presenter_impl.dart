import 'package:dartweek_fwc/app/models/group_stickers_model.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:dartweek_fwc/app/repository/stickers/stickers_repository.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  var album = <GroupStickersModel>[];
  var statusSelected = 'all';

  late final MyStickersView _view;
  final StickersRepository repository;
  List<String>? countries;

  MyStickersPresenterImpl({
    required this.repository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await repository.getMyAlbum();
    _view.loadPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      _view.updateAlbum(album);
    } else {
      final albumFilter = [
        ...album.where((element) => countries.contains(element.countryCode))
      ];
      _view.updateAlbum(albumFilter);
    }
  }
}
