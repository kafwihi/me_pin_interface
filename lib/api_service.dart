import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService{

  static Future<dynamic> _get(String url) async{
    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch(ex){
      return null;
    }
  }

  static Future<List<dynamic>> getUserList() async{//
  // return await _get('${Urls.BASE_API_URL}/users');
   return await _get('http://192.168.0.27:4000/users');

   }

   static Future<List<dynamic>> getPostList() async{
   return await _get('https://jsonplaceholder.typicode.com/posts');
   }

   static Future<dynamic> getPost(int postId) async{
   return await _get('https://jsonplaceholder.typicode.com/posts/$postId');
   }
   static Future<dynamic> getCommentsForPost(int postId) async{
   return await _get('https://jsonplaceholder.typicode.com/users');
   }

 static Future<bool> addKeyUserx(Map<String, dynamic> post) async{
  var response = await http.post('http://192.168.0.27:3000/register',
      headers: {"Content-Type": "application/json"},
      body: json.encode(post)
  );
 print('response $response');
   }

static Future<bool> addKeyUser (Map<String, dynamic> post) async {
  var url ='http://192.168.0.27:3000/register';
//https://stackoverflow.com/questions/50278258/http-post-with-json-on-body-flutter-dart
//https://www.developerlibs.com/2019/01/flutter-get-and-post-http-requests.html
//https://androidkt.com/http-post-request-in-flutter/
  //encode Map to JSON
  var body = json.encode(post);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  if( response.statusCode == 200)
  return true;
  else
  return false;
}

static Future<bool> stkPush (Map<String, dynamic> data) async {
  var url ='http://192.168.0.52/mpesa/Lipanampesa.php';

  var body = json.encode(data);
  var response = await http.post(url,body: body);
  print("${response.statusCode}");
  print("${body}");
  if( response.statusCode == 200)
  return true;
  else
  return false;
}
}