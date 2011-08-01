class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  class ::String
    require 'iconv'
    
        #
        # Return an utf-8 representation of this string.
        #
    def to_utf
      begin
        Iconv.new("utf-8", "cp1251").iconv(self)
        rescue Iconv::IllegalSequence => e
          STDERR << "!! Failed converting from UTF-8 -> cp1251 (#{self}). Already the right charset?"
        self
      end
    end
  end

end
