import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi()
abstract class PcscApiService extends ChopperService {

  static PcscApiService create([ChopperClient client]) => _$PcscApiService(client);

  // Put & Patch requests are specified the same way - they must contain the @Body
  @Post(path: 'EMapSDK.aspx')
  Future<Response> postQuery(
    @Body() Map<String, String> body,
  );
}
