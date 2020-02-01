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

  var total711StoreCount = 0;

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
      'address': '號',
    });

    List<dynamic> geoPositions = xml2json.parse711xml(response.body);

    print('$city ${geoPositions.length}');
    //
    total711StoreCount += geoPositions.length;

    if (city == '台北市') {
      var count = 0;
      for (var store in geoPositions) {
        count++;
        if (count > 3) {
          break;
        }
        var x = (double.parse(store['X'].toString())/1000000);
        var y = (double.parse(store['Y'].toString())/1000000);
        /// 門市店號：167651
        print(store['POIID']);
        ///門市店名：一零一
        print(store['POIName']);
        print('https://www.google.com/maps/@$y,$x,20z');
        ///電話：(02)27222342
        print(store['Telno']);
        ///接收傳真服務(付費)：(02)81010893
        print(store['FaxNo']);
        ///地址：台北市信義區信義路五段7號35樓
        print(store['Address']);
        print(store['Store_URL']);
        print(store['StoreImageTitle']);
        print(store['SpecialStore_Kind']);
        print('');
      }
    }
  }
  //
  print('total711StoreCount: $total711StoreCount');

  chopper.dispose();
}
