class NetworkState {
  final dynamic data;
  NetworkState(this.data);
}

class NotSend extends NetworkState {
  NotSend(data) : super(data);
}

class Sent extends NetworkState {
  Sent() : super(null);
}

class Received extends NetworkState {
  Received(data) : super(data);
}

class Failure extends NetworkState {
  Failure(data) : super(data);
}

const connectionError = "Unable to establish connection to the server.";
