<% include Header %>
<article>
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-lg-offset-1">
				<% if $URLSegment != "about" %><h1>$Title</h1><% end_if %>
				<% require themedCSS('blog', 'blog') %>

<div class="blog-entry content-container <% if $SideBarView %>unit size3of4<% end_if %>">

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

			</div>
			<div class="col-lg-3 col-lg-offset-1">
	          <% include SideNav %>
			</div>
	</div>
</article>
