import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_train/client/fetch_album.dart';
import 'package:test_train/models/album.dart';
import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('return Album if the http request complete successfully', () async {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((realInvocation) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http request complete with an error',
        () async {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(await fetchAlbum(client), throwsException);
    });
  });
}
