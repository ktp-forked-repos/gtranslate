# 
#  gtranslate.rb
#  Part of GTranslate
# 
#  Google Translate API Wrapper
#  
#  Created by Caius Durling on 2009-01-04.
#  http://caius.name/ :: dev@caius.name
#  
#  Copyright 2009 Caius Durling
#  And Licensed under the LGPL v3
#
#  GTranslate is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Lesser General Public License as 
#  published by the Free Software Foundation, either version 3 of
#  the License, or (at your option) any later version.
#  
#  GTranslate is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU Lesser General Public
#  License along with GTranslate.  If not, see 
#  <http://www.gnu.org/licenses/>.
#

require "rubygems"
require "httparty"
require "yaml"

module Google
  class Translate
    # Some custom exceptions
    class InvalidLanguage < Exception; end
    class NoPhrasePassed < Exception; end
    # Load the lanuages in from DATA
    LANGS = YAML.load(File.new(File.expand_path(File.dirname(__FILE__) + "/languages.yml")))

    # Setup HTTParty stuff
    include HTTParty
    base_uri "http://ajax.googleapis.com/ajax/services/language/translate"
    default_params :v => "1.0"
    format :json
    
    def self.method_missing method, *args
      # english_to_french
      # Takes two languages (+from+_to_+to+)
      # and a phrase and returns the translated phrase
      if find = method.to_s.match(%r{(\w+)_to_(\w+)}x)
        find = find.captures
        # Map strings into symbols,
        # and then check they exist in LANGS
        find.map! {|l| l.to_sym }.each do |l|
          raise InvalidLanguage, "#{l} isn't a supported language sorry" unless valid_language?(l)
        end
        
        # Check there is a phrase to actually translate
        raise NoPhrasePassed, "Pass a phrase to translate" if args.nil? || args.blank? || args.first.empty?
        
        # Grab the translation and return it
        get_translation :from => LANGS[find.first], :to => LANGS[find.last], :phrase => args.first
      else
        # ZOMG its not for us!
        super
      end
    end
    
    # Takes a string or symbol and returns BOOL
    def self.valid_language? lang
      LANGS.key? lang.to_sym
    end
    
    private

    # Returns the short code for the language name
    def self.lang_code lang
      LANGS[lang.to_sym]
    end

    # Actually does the heavy lifting
    def self.get_translation opts = {}
      lang_pair = {:langpair => "#{opts[:from]}|#{opts[:to]}"}
      get('', :query => {:q => opts[:phrase]}.merge(lang_pair))["responseData"]["translatedText"]
    end
  end
  
  # And add Tr for anyone lazy
  const_set "Tr", Translate
end