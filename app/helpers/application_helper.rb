module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML

    def block_code(code, language)
      Pygments.highlight(code, lexer: language, options: {lineanchors: "line"})
    end
    def autolink(link, link_type)
      case link_type
      when :url then url_link(link)
      when :email then email_link(link)
      end
    end
    def url_link(link)
        if link.include?("https://www.youtube.com")
          youtube_link(link)
        elsif link.include?("https://vimeo.com")
          vimeo_link(link)
        elsif link.downcase.include?(".jpg") || link.downcase.include?(".jpeg") || link.downcase.include?(".gif") || link.downcase.include?(".png")
          image_link(link)
        else
          normal_link(link)
      end
    end
    def youtube_link(link)
      parameters_start = link.index('=')
      video_id = link[parameters_start + 1..-1]
      "<div class='embed-container'>
        <iframe width=\"100%\" height=\"400\" src=\"https://www.youtube.com/embed/#{video_id}?autoplay=0\" frameborder=\"0\" allowfullscreen></iframe>
      </div>"
    end
    def vimeo_link(link)
      parameters_start = link.index(/[0-9]/)
      video_id = link[parameters_start..-1]
      "<div class='embed-container'>
        <iframe src=\"https://player.vimeo.com/video/#{video_id}\" width=\"100%\" height=\"360\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
      </div>"
    end
    def image(link, title, alt_text)
      if title =~ /=(\d+)x(\d+)/
        %(<img src="#{link}" width="#{$1}px" height="#{$2}px" class="img-responsive" alt="#{alt_text}>")
      elsif title =~ /=(\d+)x/
        %(<img src="#{link}" width="#{$1}px" class="img-responsive" alt="#{alt_text}>")
      elsif title =~ /=x(\d+)/
        %(<img src="#{link}" height="#{$1}px" class="img-responsive" alt="#{alt_text}>")
      else
        %(<img src="#{link}" title="#{title}" class="img-responsive" alt="#{alt_text}">)
      end
    end
    def normal_link(link)
      "<a href=\"#{link}\" target=\"_blank\">#{link}</a>"
    end
    def email_link(email)
      "<a href=\"mailto:#{email}\">#{email}</a>"
    end
  end

  def markdown(content)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      ugly: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
