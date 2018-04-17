require 'redcarpet'
module ApplicationHelper
  def to_markdown(text)
    @renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true) if @renderer.nil?
    @markdown = Redcarpet::Markdown.new(@renderer) if @markdown.nil?
    @markdown.render(text).html_safe
  end

  def title(text)
    if text.present?; text = "#{text} | Dylan Thinnes"
    else;             text = "Dylan Thinnes"
    end
    return text
  end
end
