import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

Future<void> main(List<String> arguments) async {
  final commandRunner = CommandRunner(
    onError: (Object error) {
      if (error is Error) {
        throw error;
      }
      if (error is Exception) {
        print(error);
      }
    },
  )..addCommand(HelpCommand());

  await commandRunner.run(arguments);
}