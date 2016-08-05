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

CSS of pagination:
.next >a, .pager .next>span: float: right;

.pager li>a, .pager li>span
display: inline-block;
    padding: 5px 14px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 15px;

    %= will_paginate @obj_instance, :prev_label => '<<', :next_label => '>>' %>

    That’s it, just give what ever value you like to prev_label and next_label symbols.

    Similarly, if you want to add images then do this

    <%= will_paginate @obj_instance, :prev_label => image_tag('n9.gif'), :next_label => image_tag('n8.gif') %>

/***** IMAGE ******/
show.html.erb
<!-- Preview Image -->
<img class="img-responsive" src="http://placehold.it/900x300" alt="">


      <!-- Footer -->
      <footer>
          <div class="row">
              <div class="col-lg-12">
                  <p>Copyright &copy; Brunogtavares 2016</p>
              </div>
              <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
      </footer>




      if title =~ /=(\d+)x(\d+)/
        %(<img src="#{link}" width="#{$1}px" height="#{$2}px" alt="#{alt_text}>")
      elsif title =~ /=(\d+)x/
        %(<img src="#{link}" width="#{$1}px" alt="#{alt_text}>")
      elsif title =~ /=x(\d+)/
        %(<img src="#{link}" height="#{$1}px" alt="#{alt_text}>")
      else
        %(<img src="#{link}" title="#{title}" alt="#{alt_text}">)
      end

/\A([\w\.%\+\-])@([\w]{2,})\z/i

background to test #EEEEEE
