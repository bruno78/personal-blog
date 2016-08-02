class MarkdownRendererWithSpecialLinks < Redcarpet::Render::HTML

  def autolink(link, link_type)
    case link_type
      when :url then url_link(link)
      when :email then email_link(link)
    end
  end

  def url_link(link)
    case link
      when /^http:\/\/youtube/ then youtube_link(link)
      when /^http:\/\/vimeo/ then vimeo_link(link)
      else normal_link(link)
    end
  end

  def youtube_link(link)
    parameters_start = link.index('?')
    video_id = link[15..(parameters_start ? parameters_start-1 : -1)]
    "<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/#{video_id}?rel=0\" frameborder=\"0\" allowfullscreen></iframe>"
  end

  def vimeo_link(link)
    parameters_start = link.index('/')
    video_id = link[15..(parameters_start ? parameters_start-1 : -1)]
    "<iframe src=\"https://player.vimeo.com/video/#{video_id}\" width=\"640\" height=\"266\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>"
  end

  def normal_link(link)
    "<a href=\"#{link}\">#{link}</a>"
  end

  def email_link(email)
    "<a href=\"mailto:#{email}\">#{email}</a>"
  end

end
