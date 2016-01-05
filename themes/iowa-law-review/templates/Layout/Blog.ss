<% include Header %>
<article>
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-lg-offset-1">
				<article>
					<h1>
						<% if $ArchiveYear %>
							<%t Blog.Archive 'Archive' %>:
							<% if $ArchiveDay %>
								$ArchiveDate.Nice
							<% else_if $ArchiveMonth %>
								$ArchiveDate.format('F, Y')
							<% else %>
								$ArchiveDate.format('Y')
							<% end_if %>
						<% else_if $CurrentTag %>
							<%t Blog.Tag 'Tag' %>: $CurrentTag.Title
						<% else_if $CurrentCategory %>
							<%t Blog.Category 'Category' %>: $CurrentCategory.Title
						<% else %>
							$Title
						<% end_if %>
					</h1>

					<div class="content">$Content</div>

					<% if $FeaturedBlogPosts.Exists && $FeaturedBlogPosts.First %>
						<% with $FeaturedBlogPosts.First %>
							<% include FeaturedPostSummary %>
						<% end_with %>
					<% end_if %>
					<% if $PaginatedList.Exists %>
						<% loop $PaginatedList %>
							<% include PostSummary %>
						<% end_loop %>
					<% else %>
						<% if $FeaturedBlogPosts.Exists %>
							<p><%t Blog.NoUnfeaturedPosts 'There are no non-featured posts' %></p>
						<% else %>
							<p><%t Blog.NoPosts 'There are no posts' %></p>
						<% end_if %>
					<% end_if %>
				</article>

				$Form
				$CommentsForm

				<% with $PaginatedList %>
					<% include Pagination %>
				<% end_with %>
			</div>
				
			<div class="col-lg-3 col-lg-offset-1">
			 <% if $SideBarView %>
					<div class="blog-sidebar typography unit size1of4 lastUnit">
						$SideBarView
					</div>
				<% end_if %>
	          <% include SideNav %>

			</div>


	</div>
</article>

