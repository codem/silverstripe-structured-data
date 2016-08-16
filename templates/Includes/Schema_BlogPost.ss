<script type="application/ld+json">
	{
		"@context": "http://schema.org",
		"@type": "Blog",
		"mainEntity": {
			"@type":"BlogPosting",
			"@id":"$AbsoluteLink",
			"datePublished" : "$Created.Rfc822",
			"dateModified" : "$LastEdited.Rfc822",
			<% if $Comments.exists %>"commentCount" : "$Comments.count",<% end_if %>
			<% if $Tags.exists %>"keywords" : [<% loop $Tags %>"$Title.XML"<% if not Last %>,<% end_if %><% end_loop %>],<% end_if %>
			"publisher" : {
				"@type" : "Organization",
				"name" : "$SiteConfig.Title",
				"logo" : {
					"@type" : "ImageObject",
					"url" : "$AbsoluteLogoURL"
				}
			},
			"headline":"$Title.XML",
			"description":"$Excerpt.XML",
			<% if FeatureImage %>
			"image" : {
				"@type" : "ImageObject",
				"contentUrl" : "$FeatureImage.AbsoluteURL",
				"url" : "$FeatureImage.AbsoluteURL",
				"width" : "$FeatureImage.Width",
				"height" : "$FeatureImage.Height"
			},
			<% end_if %>
			"author" : [
				<% loop DynamicCredits %>
				{
					"@type": "Person",
					"familyName": "$Surname.XML",
					"givenName": "$FirstName.XML",
					"name": "$FirstName.XML $Surname.XML"
					<% if URL %>,"url" : "$URL"<% end_if %>
				}
				<% if not Last %>,<% end_if %>
				<% end_loop %>
			],
			"mainEntityOfPage" : "$AbsoluteLink"
		}
	}
</script>
