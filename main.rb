RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

require_relative 'lib/simulator'

welcome_message = <<~MSG

  Welcome to Toy Robot Simulator!

  Commands: PLACE X,Y,DIRECTION | MOVE | LEFT | RIGHT | REPORT
  Directions: #{Simulator::DIRECTIONS.keys.join(" | ")}

  Refer to the README for more information.

MSG

puts welcome_message

Signal.trap("INT") { puts; exit }

Simulator.play
