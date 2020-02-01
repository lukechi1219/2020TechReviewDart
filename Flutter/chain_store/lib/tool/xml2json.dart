import 'dart:convert';

import 'package:xml2json/xml2json.dart';

/// https://emap.pcsc.com.tw/EMapSDK.aspx
/// POST data: commandid=SearchStore&city=台北市&address=路
///
List<dynamic> parse711xml(String xmlString) {
  try {
    final Xml2Json xml2json = Xml2Json();

    xml2json.parse(xmlString);
//  print('XML string');//  print(xmlString);//  print('');

    // Transform to JSON using Parker
    String jsonStr = xml2json.toParker();
//  print('Parker');//  print('');//  print(jsonStr);

    var data = json.decode(jsonStr);
//    print('decoded data');print('');print(data);

    if (data['iMapSDKOutput'] == null ||
        data['iMapSDKOutput']['Status'] != '連線成功' ||
        data['iMapSDKOutput']['GeoPosition'] == null) {
      return [];
    }
//    print('');print(data['iMapSDKOutput']);
//    print('');print(data['iMapSDKOutput']['GeoPosition'][0]);

    return data['iMapSDKOutput']['GeoPosition'];

  } catch (err) {
    print(err);
  }
  return [];
}

//void main() {
//  print('xml2json main()');
//
//  var xmlString = '<?xml version="1.0" encoding="utf-8"?><iMapSDKOutput>'
//      '<MessageID>00000</MessageID>'
//      '<CommandID>SearchStore</CommandID>'
//      '<Status>連線成功</Status>'
//      '<TimeStamp>2020/2/1 上午 11:17:45</TimeStamp>'
//      '<GeoPosition><POIID>186010              </POIID><POIName>台北灣</POIName><X>121431081</X><Y>25186426</Y><Telno>(02)26236308        </Telno><FaxNo>(02)26229438        </FaxNo><Address>新北市淡水區新市一路一段108號1樓</Address><SpecialStore_Kind></SpecialStore_Kind><Store_URL></Store_URL><StoreImageTitle>02廁所,03ATM,04座位區,13台塑有機蔬菜,14無印良品,22現蒸地瓜,33日本7-ELEVEN限定,34國際精品專櫃</StoreImageTitle></GeoPosition>'
//      '<GeoPosition><POIID>149583              </POIID><POIName>鑫台北</POIName><X>121518477</X><Y>25046208</Y><Telno>(02)23312768        </Telno><FaxNo>(02)23890381        </FaxNo><Address>台北市中正區黎明里忠孝西路一段35號一樓</Address><SpecialStore_Kind></SpecialStore_Kind><Store_URL></Store_URL><StoreImageTitle>03ATM,04座位區,05ibon WiFi,11千禧健康小站,14無印良品,16美妝,17黃金玉米(蒸煮),19ibon,21現萃茶,22現蒸地瓜,33日本7-ELEVEN限定,34國際精品專櫃</StoreImageTitle></GeoPosition>'
//      '</iMapSDKOutput>';
//
//  parse711xml(xmlString);
//}
