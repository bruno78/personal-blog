/****** SEARCH *******/

This goes on the index.html.erb page:

<form action="<%= posts_path %>" method="get" >
  <%= text_field_tag :search, params[:search] %>
  <%= submit_tag "Search", name: nil %>
</form>

If I can implement the search this goes on _post.html.erb:

<% if @posts.present? %>
  <%= render @posts %>
<% else %>
  <p>There are no posts containing the term(s) <%= params[:search] %>.</p>
<% end %>

this goes on posts_controller.html.erb page;
elsif params[:search]
  @posts = Post.search(params[:search])
          .paginate(:page => params[:page], :per_page => 3)
          .order('created_at DESC')



This goes on the application.html.erb page:

<!-- Project Search Well -->
<div class="well">

  <!-- Project search
    <h4>Project Search</h4>
    <div class="input-group">
        <input type="text" class="form-control">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button">
                <span class="glyphicon glyphicon-search"></span>
        </button>
        </span>
    </div>
       /.input-group -->

</div>

just after this:
<!-- Project Sidebar Widgets Column -->
<div class="col-md-4">

Goes on post.rb at model

def self.search(search)
  return scoped unless search.present?
  where("title LIKE ?", "%#{search}%")
  where("blurb LIKE ?", "%#{search}%")
  where("body LIKE ?", "%#{search}%")
end

/***** PAGINATION *****/

This goes on index.html.erb

<!-- Pager
<ul class="pager">
    <li class="previous">
        <a href="#">&larr; Older</a>
    </li>
    <li class="next">
        <a href="#">Newer &rarr;</a>
    </li>
</ul> -->

/***** IMAGE ******/
show.html.erb
<!-- Preview Image -->
<img class="img-responsive" src="http://placehold.it/900x300" alt="">
