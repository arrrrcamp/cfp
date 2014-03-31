module ApplicationHelper
  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end

  def markdown text
    markdown_renderer.render(text).html_safe
  end
end
