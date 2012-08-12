# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'cub'
require 'yaml'

describe Cub do
  context '証券コードに対応する会社が存在する場合' do
    it '会社名を表示' do
      Cub.company(7203).should eq('トヨタ自動車')
    end
  end

  context '証券コードに対応する会社が存在しない場合' do
    it '例外を返す' do
      lambda{ Cub.company(0000) }.should raise_error(Cub::CompanyException)
    end
  end

  context '証券コードが無効な場合' do
    it '例外を返す' do
      lambda{ Cub.company(333)    }.should raise_error(Cub::CompanyException)
      lambda{ Cub.company(55555)  }.should raise_error(Cub::CompanyException)
      lambda{ Cub.company('abcd') }.should raise_error(Cub::CompanyException)
    end
  end
end
