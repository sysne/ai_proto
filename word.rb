#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

require 'MeCab'

def get_feature_from_text(text,mecab)
  result = []
  node = mecab.parseToNode(text)
  while node do
    p "#{node.surface}  #{node.feature.split(',')[0]}".force_encoding("UTF-8")
    node = node.next
  end
end

str = gets
m = MeCab::Tagger.new
p get_feature_from_text(str, m)
