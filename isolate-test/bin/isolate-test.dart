import 'dart:async';
import 'dart:isolate';

main(List<String> args) {
  start();
  print("start");
}

Isolate isolate;

int i = 1;

void start() async {
  //接收消息的主Isolate的端口
  final receivePort = ReceivePort();
  isolate = await Isolate.spawn(runTimer, receivePort.sendPort);

  SendPort sendPort;
  receivePort.listen((data) {
    if (data is SendPort) {
      sendPort = data;
      print("Receive sendPort: $data ; i :$i");
    } else {
      print("Receive : $data ; i :$i");
      sendPort.send('from main isolate, Receive your msg : $data ; i :$i');
    }
  });
}

void stop(){
  print("kill isolate");
  isolate?.kill(priority: Isolate.immediate);
  isolate = null;
}

void runTimer(SendPort port) {
  final receivePort = ReceivePort();
  receivePort.listen((data) {
    print(data);
  });
  port.send(receivePort.sendPort);
  int counter = 0;
  Timer.periodic(const Duration(seconds: 1), (_) {
    counter++;
    i++;
    final msg = "notification $counter";
    print("Send :$msg ;i :$i");
    port.send(msg);
  });
}