# frozen_string_literal: true

logs = <<~LGSINPUT
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
LGSINPUT

def contains_error?(reg_exp)
  ->(line) { line =~ reg_exp }
end

def task_1(logs)
  ask_contains_error = contains_error?(/error/i)
  logs.each_line do |line|
    puts line if ask_contains_error.call(line)
  end
end

task_1(logs)
