require 'blog_render'
module ApplicationHelper
  def parse_content(content)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrouhg: true,
      superscript: true
    }
    Redcarpet::Markdown.new(BlogRender, options).render(content).html_safe
  end

  def meta_og_tags(properties = {})
    return unless properties.is_a? Hash
    tags = []
    properties.each do |property, value|
      tags << tag.meta(property: "og:#{property}", content: value)
    end
    tags.join.html_safe
  end
end
