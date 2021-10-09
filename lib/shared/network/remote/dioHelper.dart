import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_app/logic/providers/loginProvider.dart';
import 'package:provider/provider.dart';

class DioHelper{

  Dio _dio = Dio();

  Map<String, dynamic> headers(String token)=> {
    'Authorization' : 'Token $token',
    'Accept' : 'application/vnd.github.v3+json',
  };

  Future<Response> post(BuildContext context ,{
    @required String path,
    Map<String ,dynamic> body,
    String token
  }) async{
    Response post = await _dio.post(path,
        options: Options(headers: headers(token)),
        queryParameters: body ??{}
    );
    return post;
  }


  Future<Response> get(BuildContext context ,{
    @required String path,
    Map<String ,dynamic> body,
    String token
  }) async{
    Response get = await _dio.get(path,
        options: Options(headers: headers(token)),
        queryParameters: body ??{}
    );
    return get;
  }

  Future<Response> put(BuildContext context ,{
    @required String path,
    @required Map<String ,dynamic> body,
    String token
  }) async{
    
    Response get = await _dio.put(path,
        options: Options(headers: headers(token)),
        queryParameters: body ??{}
    );
    return get;
  }


  Future<Response> delete(BuildContext context ,{
    @required String path,
    Map<String ,dynamic> body,
    String token
  }) async{
    
    Response get = await _dio.delete(path,
        options: Options(headers: headers(token)),
        queryParameters: body ??{}
    );
    return get;
  }

}