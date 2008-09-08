require 'cgi'
require 'iconv'

module UnescapeHtml
  def unescape_html
    Iconv.conv("UTF-8", 'ISO-8859-1', CGI::unescapeHTML(self))
  end
end

String.send :include, UnescapeHtml