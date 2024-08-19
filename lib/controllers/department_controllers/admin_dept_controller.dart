import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class DepartmentController {
  final StreamController<List<dynamic>> _streamController =
      StreamController<List<dynamic>>.broadcast();
  late Stream<List<dynamic>> dataStream;
  late String archiveVal = 'false';
  late bool onSearched = false;

  setArchived(String value) {
    archiveVal = value;
  }

  setStream() {
    dataStream = _streamController.stream;
  }

  getDataStream() {
    return dataStream;
  }

  closeStream() {
    _streamController.close();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:9000/api/dept/get'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) ?? [];
        _streamController.add(data);
      } else {
        _streamController.addError('Error: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }

  Future<dynamic> fetchDataByDeptNameID(String params) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:9000/api/dept/getfiltered').replace(
          queryParameters: {
            'deptid': params,
            'name': params,
          },
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) ?? [];
        _streamController.add(data);
      } else {
        // Handle non-200 responses
        _streamController.addError('Error: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }

  Future<void> fetchDataByArchived(archiveVal) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:9000/api/dept/getfiltered')
            .replace(queryParameters: {'isarchived': archiveVal}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) ?? [];

        _streamController.add(data);
      } else {
        _streamController.addError('Error: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }

  Future<dynamic> searchDeptByArchived(String params) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:9000/api/dept/getfiltered').replace(
            queryParameters: {
              'deptid': params,
              'name': params,
              'isarchived': archiveVal
            }),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) ?? [];
        _streamController.add(data);
      } else {
        _streamController.addError('Error: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }

  Future<dynamic> createDepartment(String deptName) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:9000/api/dept/post'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'name': deptName}),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        await fetchDataByArchived(archiveVal);
      } else {
        return data.toString();
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }

  Future<dynamic> updateDept(String deptID, String deptName) async {
    try {
      final response = await http.put(
        Uri.parse('http://localhost:9000/api/dept/update$deptID'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'name': deptName}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (onSearched == true) {
          _streamController.add(data);
        } else {
          fetchDataByArchived(archiveVal);
        }
      } else {
        return data.toString();
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }

  Future<dynamic> archiveDept(String deptID, bool isArchived) async {
    try {
      final response = await http.put(
        Uri.parse('http://localhost:9000/api/dept/archive$deptID'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'isarchived': isArchived}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        await fetchDataByArchived(archiveVal);
      } else {
        return data;
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }

  Future<void> deleteDept(String deptID) async {
    try {
      final response = await http
          .delete(Uri.parse('http://localhost:9000/api/dept/delete$deptID'));
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        await fetchDataByArchived(archiveVal);
      } else {
        return data;
      }
    } on SocketException catch (_) {
      _streamController
          .addError('Network error: Unable to connect to the server.');
    } catch (_) {
      _streamController.addError('An unexpected error occurred');
    }
  }
}
