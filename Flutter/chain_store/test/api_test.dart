import 'package:chain_store/api/post_api_service.dart';
import 'package:chain_store/tool/xml2json.dart' as xml2json;
import 'package:chopper/chopper.dart';

/// https://pub.dev/packages/chopper
/// https://resocoder.com/2019/06/19/chopper-retrofit-for-flutter-basics/
/// https://emap.pcsc.com.tw/EMapSDK.aspx
/// commandid=SearchStore&city=台北市&address=路
/// https://www.youtube.com/resocoder
/// https://www.youtube.com/watch?v=zFXK5EsrUF0
/// https://resocoder.com/courses/3-flutters-secret-weapons/
/// https://resocoder.com/good-code-quiz/
void main() {
  var cityList = [
    '基隆市',
    '台北市',
    '新北市',
    '桃園市',
    '新竹市',
    '新竹縣',
    '苗栗縣',
    '台中市',
    '南投縣',
    '彰化縣',
    '雲林縣',
    '嘉義市',
    '嘉義縣',
    '台南市',
    '高雄市',
    '屏東縣',
    '宜蘭縣',
    '花蓮縣',
    '台東縣',
    '澎湖縣',
    '金門縣',
    '連江縣',
  ];
  testApi(cityList);
}

void testApi(List<String> cityList) async {
  //
  final chopper = ChopperClient(
    baseUrl: 'https://emap.pcsc.com.tw',
    services: [
      // the generated service
      PcscApiService.create()
    ],
  );
  final myService = PcscApiService.create(chopper);

  for (var city in cityList) {
    final response = await myService.postQuery({
      'commandid': 'SearchStore',
      'city': city,
      'address': '路',
    });
//  print(response.body);
    List<dynamic> geoPositions = xml2json.parse711xml(response.body);
    print('$city ${geoPositions.length}');
  }

  chopper.dispose();
}
