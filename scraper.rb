#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'scraperwiki'
require 'twitter_list'

require 'pry'

abort "Need to set ENV['MORPH_TWITTER_TOKENS']" unless ENV.key? 'MORPH_TWITTER_TOKENS'
twitter_list = TwitterList::Scraper.new(twitter_tokens: 'ENV['MORPH_TWITTER_TOKENS']')

twitter_list_arr = (
twitter_list.people('ParlamentTweets', 'glp-parlamentarier') +
twitter_list.people('ParlamentTweets', 'grüne-parlamentarier') +
twitter_list.people('ParlamentTweets', 'svp-parlamentarier') +
twitter_list.people('ParlamentTweets', 'fdp-parlamentarier') +
twitter_list.people('ParlamentTweets', 'cvp-parlamentarier') +
twitter_list.people('ParlamentTweets', 'sp-parlamentarier') ).uniq

ScraperWiki.save_sqlite([:id], twitter_list_arr)
