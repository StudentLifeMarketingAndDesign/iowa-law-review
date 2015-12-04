<%-- if $ClassName == "Article" %>

	<% loop $Authors %>
		<a href="#author-{$ID]-note">$Name</a>
		<div class="hidden">$Note</
<% else %>

<% end_if --%>

<% if $Authors %>
	<em>
		<% if $Authors.Count == 2 %>
			<a href="$Authors.First.Link">{$Authors.First.Name}<% if $Authors.First.ArticleNote %>*<% end_if %></a> and <a href="$Authors.Last.Link">{$Authors.Last.Name} <% if $Authors.Last.ArticleNote %>*<% end_if %></a>
		<% else %>
			<% loop $Authors %>
				<a href="$Link">$Name</a><% if not $Last %>, <% end_if %>
			<% end_loop %>			
		<% end_if %>
	</em><br />
<% end_if %>