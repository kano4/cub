# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/cub/version')
require 'yaml'

module Cub
  @@companies = YAML.load_file(File.dirname(__FILE__) + '/../companies.yml')

  class CompanyException < StandardError
  end

  def self.company(code)
    if valid_code?(code)
      company_name(code)
    else
      raise CompanyException, "無効な証券コード"
    end
  end

  private
  def self.valid_code?(code)
    /^\d{4}$/ =~ code.to_s
  end

  def self.company_name(code)
    company = @@companies[code]

    if company.nil?
      raise CompanyException, "証券コードに対応する会社が存在しない"
    else
      company
    end
  end

end
