abstract interface class Environment {
  Uri get apiBaseUrl;
}

class DebugEnvironment implements Environment {
  @override
  final Uri apiBaseUrl = Uri.parse('https://b29dfe3d-42dc-4736-a4cd-99f622396ec6.mock.pstmn.io');
}
