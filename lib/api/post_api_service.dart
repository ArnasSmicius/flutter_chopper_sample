import 'package:chopper/chopper.dart';
import 'package:flutter_chopper_sample/api/mobile_data_interceptor.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_chopper_sample/api/model/built_post.dart';

import 'converters/built_value_converter.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked",
// you need to use the part keywork.
part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<BuiltPost>> getPost(@Path('id') int id);

  @Post()
  Future<Response<BuiltPost>> postPost(
    @Body() BuiltPost post,
  );

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiService(),
      ],
      interceptors: [HttpLoggingInterceptor()],
      converter: BuiltValueConverter(),
    );
    return _$PostApiService(client);
  }
}
