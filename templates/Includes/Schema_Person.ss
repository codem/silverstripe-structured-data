<script type="application/ld+json">
	{
		"@context": "http://schema.org",
		"@type":"Person",
		"@id":"$AbsoluteLink",
		"name" : "$Firstname.XML $Lastname.XML",
		"url" : "$AbsoluteLink",
		"description":"$ShortDescription.XML",
		"jobTitle": "$Position.XML",
		<% if SchemaParent %>
			<% with SchemaParent %>
				"worksFor" : {
					"@type" : "Organization",
					"name" : "$SchemaOrganisation.XML",
					"alternateName" : "$SchemaAlternateName.XML",
					"description" : "$SchemaDescription.XML"
				},
			<% end_with %>
		<% end_if %>
		"colleague": [
			<% if RelatedTeamMembers %><% loop RelatedTeamMembers %>"$AbsoluteLink"<% if not Last %>,<% end_if %><% end_loop %><% end_if %>
		],
		<% if Image %>
		"image" : {
			"@type" : "ImageObject",
			"contentUrl" : "$Image.AbsoluteURL",
			"url" : "$Image.AbsoluteURL",
			"width" : "$Image.Width",
			"height" : "$Image.Height"
		},
		<% end_if %>
		"mainEntityOfPage" : "$AbsoluteLink"
	}
</script>
