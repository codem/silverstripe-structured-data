<script type="application/ld+json">
	{
		"@context": "http://schema.org",
		"@type": "WebSite",
		"mainEntity": {
			"@type":"WebPage",
			"@id":"$AbsoluteLink",
			"datePublished" : "$Created.Rfc822",
			"dateModified" : "$LastEdited.Rfc822",
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
			"author" : {
				"@type" : "Organization",
				"name" : "$SiteConfig.Title",
				"logo" : {
					"@type" : "ImageObject",
					"url" : "$AbsoluteLogoURL"
				}
			},
			"mainEntityOfPage" : "$AbsoluteLink"
		}
	}
</script>
