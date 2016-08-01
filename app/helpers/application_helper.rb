module ApplicationHelper
  require 'markdown_renderer_with_special_links'
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  def markdown(content)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end

=begin
1st code:
Redcarpet::Markdown.new(renderer, options).render(content).html_safe
2nd code:
Redcarpet::Markdown.new(MarkdownRendererWithSpecialLinks, renderer, options).render(content).html_safe
3rd code:
@markdown ||= Redcarpet::Markdown.new(MarkdownRendererWithSpecialLinks, autolink: true, space_after_headers: true, fenced_code_blocks: true)
@markdown.render(content).html_safe
=end
