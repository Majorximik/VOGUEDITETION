import 'dart:async';
import 'package:command_runner/command_runner.dart';

class PrettyEcho extends Command {
  PrettyEcho() {
    addFlag(
      'blue-only',
      abbr: 'b',
      help: 'When true, the echoed text will all be blue.',
    );
  }

  @override
  String get name => 'echo';

  @override
  bool get requiresArgument => true;

  @override
  String get description => 'Print input, but colorful.';

  @override
  String? get help =>
      'echos a String provided as an argument with ANSI coloring,';

  @override
  String? get valueHelp => 'STRING';

  @override
  FutureOr<String> run(ArgResults arg) {
    if (arg.commandArg == null) {
      throw ArgumentException(
        'This argument requires one positional argument',
        name,
      );
    }

    final List<String> prettyWords = [];
    final words = arg.commandArg!.split(' ');

    for (var i = 0; i < words.length; i++) {
      final word = words[i];

      if (arg.flag('blue-only')) {
        prettyWords.add(word.titleText);
      } else if (i % 3 == 0) {
        prettyWords.add(word.titleText);
      } else if (i % 3 == 1) {
        prettyWords.add(word.instructionText);
      } else {
        prettyWords.add(word.errorText);
      }
    }

    return prettyWords.join(' ');
  }
}

Future<void> main(List<String> arguments) async {
  final runner = CommandRunner()..addCommand(PrettyEcho());
  await runner.run(arguments);
}