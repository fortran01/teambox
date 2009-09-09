module PagesHelper
  def new_page_link(project)
    link_to 'New Page', new_project_page_path(project)
  end
  
  def page_fields(f)
    render :partial => 'pages/fields', :locals => { :f => f }
  end
  
  def list_pages(pages)
    render :partial => 'pages/page', :collection => pages
  end
  
  def edit_page_link(project,page)
    link_to h(page.name), edit_project_page_path(project,page)
  end
  
  def notes_sortable_tag(page)
    url = project_page_path(page.project,page)
    update_page_tag do |page|
      page.notes_sortable(url)
    end
  end
  
  def notes_sortable(url)
    page.sortable('notes', {
      :tag => 'div',
      :handle => 'img.drag',
      :url => url,
      :method => :put
    })
  end
end