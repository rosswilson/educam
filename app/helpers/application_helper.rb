module ApplicationHelper
 def title(page_title)
    content_for(:title) { page_title }
    page_title.chomp!
  end

  def sidebar(&content)
    content_for(:sidebar) { yield(content) }
  end 
end
