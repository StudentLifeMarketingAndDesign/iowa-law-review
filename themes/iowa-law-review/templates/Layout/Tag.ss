<% include Header %>
<article>
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<h1>Search Results For: $Tag.Title</h1>
				<div class="article-card-container">
					<% loop $Articles %>
					<% include ArticleCard %>
					<% end_loop %>
				</div>
			</div>
		</div>
	</div>
</article>