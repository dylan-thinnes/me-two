require 'redcarpet'
module ApplicationHelper
  def to_markdown(text)
    @renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true) if @renderer.nil?
    @markdown = Redcarpet::Markdown.new(@renderer) if @markdown.nil?
    @markdown.render(text).html_safe
  end

  def get_title
    return @title if @title.present?
    return "Dylan Thinnes"
  end

  def set_title(text)
    @title = "#{text} | Dylan Thinnes"
  end
end
