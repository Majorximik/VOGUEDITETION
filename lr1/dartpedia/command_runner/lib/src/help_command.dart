import 'dart:async';

import 'arguments.dart';

class HelpCommand extends Command {
  HelpCommand() {
    addFlag(
      'verbose',
      abbr: 'v',
      help: 'Show each command and its options.',
    );
    addOption(
      'command',
      abbr: 'c',
      help: 'Show detailed help for one command.',
    );
  }

  @override
  String get name => 'help';

  @override
  String get description => 'Prints usage information to the command line.';

  @override
  String? get help => 'Prints this usage information';

  @override
  FutureOr<Object?> run(ArgResults args) {
    var usage = runner.usage;
    for (final command in runner.commands) {
      usage += '\n ${command.usage}';
    }
    return usage;
  }
}