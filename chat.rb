#! ruby -Ks
# -*- coding: utf-8 -*-

class Responder
  def initialize(name)
    @name = name
  end

  def response(input)
    special_text = text input
    return special_text ? special_text : "What is #{input} ... ?"
  end

  def name
    return @name
  end

  def text(input)
    begin
      File.open('ai.txt') do |file|
        file.read.split('\n').each do |labmen|
          requests = labmen.split(',')
        end
      end
    rescue SystemCallError => e
      puts %Q(class=[#{e.class}] message=[#{e.message}])
    rescue IOError => e
      puts %Q(class=[#{e.class}] message=[#{e.message}])
    end
    return '' if (input == 'nice to meet you.')
    return false
  end
end

class Unmo                              # (2)
  def initialize(name)
    @name = name
    @responder = Responder.new('Response')  # (3)
  end

  def dialogue(input)
    return @responder.response(input)
  end

  def responder_name
    return @responder.name
  end

  def name
    return @name
  end
end

def prompt(unmo)                        # (4)
  return unmo.name + ':' + unmo.responder_name + '> '
end

puts('prototype : mimi')   # (5)
proto = Unmo.new('mimi')
while true                              # (6)
  print('> ')
  input = gets
  input.chomp!
  break puts 'see you ...'  if input == ''

  response = proto.dialogue(input)      # (7)
  puts(prompt(proto) + response)
end
