module ApplicationHelper
  def syntax_highlighter(text, language)
    formatter = Rouge::Formatters::HTML.new("monokai")
    lexer = Rouge::Lexer.find(language)
    formatter.format(lexer.lex(text))
  end
end
