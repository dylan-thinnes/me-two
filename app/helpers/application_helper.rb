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

  def hexify(c)
    "%02x" % c
  end

  def base_colours
    { projects: "#44af69", blog: "#f8333c", contact: "#2b9eb3" }
  end

  def rain_colours
    [ "#fb5721", # reddish
      "#efac22", # orangish
      "#106f22", # greenish
      "#651993", # indigoish
      "#47478d", # blueish
    ]
  end

  def get_colour(name)
    colour = base_colours[name.to_sym]
    return colour if !colour.nil?

    return rain_colours[rand * rain_colours.length]
  end
end
