module ApplicationHelper

  def syntax_highlighter(text, language)
    formatter = Rouge::Formatters::HTMLInline.new("monokai")
    lexer = Rouge::Lexer.find(language)
    formatter.format(lexer.lex(text))
  end
end
