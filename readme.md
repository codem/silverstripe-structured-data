## Structured Data

Structured data is important, it helps your organize your pages based on a set structure published by schema.org
For the purposes of this module, a "page" is anything that can be accessed directly via a URL. For Silverstripe
this can include anything extending SiteTree or any DataObject that can be rendered via a request to a Controller method

At this point in time, templates exist for Organization, BlogPost, Person and WebPage. There are many, many schemas and these can be added over time.
The end goal is to provide an extension to ModelAdmin where your schema.org metadata can be managed.

## Templating

As templates come in many shapes and sizes, the easiest way to provide schema.org markup is via an ld+json script. You can, of course, roll your own templates based on schema data.

You can include templates directly in your templates without using the DataExtensions provided.

## Requirements
 * PHP 5.3, preferably 5.6
 * Silverstripe >= 3.4 - this probably works on < 3.4 but it hasn't yet been tested on anything less
 
### TODO

Documentation, of course.