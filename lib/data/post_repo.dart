import 'package:app_using_bloc/data/api/api_service.dart';

import 'modal/post.dart';

class PostRepo {
  final ApiService _apiService;

  PostRepo(this._apiService);

  Future<List<Post>> getPost() => _apiService.getPost();
}
