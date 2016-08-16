<?php
/**
 * Base class for all Things schema, your dataobjects can have ONE of these extension classes as a schema extension.
 * Templating is handled in JSON-LD in order to avoid polluting your HTML templates (although you can roll your own microdata templates)
 * If your schema is not listed here, put in a request to add it or better yet, roll your own and submit a pull request
 * 
 * In order to attach a schema to a dataobject, list the relevant schema in a has_one relation. This is not done as a DataExtension in order to avoid polluting your DataObject database table column names.
 */
 

/**
 * DataObjects with a Schema should have this as an extension
 */
class SchemaExtension extends DataExtension {
	
	static private $has_many = array(
		'Schemas' => 'SchemaThing',
	);
	
	public function updateCmsFields(FieldList $fieldlist) {
			
		$fieldlist->removeByName('Schemas');
		
		$config = GridFieldConfig_RelationEditor::create();
		$config->addComponent(new GridFieldOrderableRows('cmsSortOrder'));
		$gridfield = new GridField('Schemas', 'Schemas', $this->owner->Schemas()->sort('cmsChosenSchema DESC'), $config);
		
		$fieldlist->addFieldsToTab('Root.Schema', array(
			new LiteralField('SchemaFieldHelper', '<p class="message">Choose a schema entry to represent this record.</p>'),
			$gridfield
		));
		
	}
}

/**
 * Schema storage, these mutate depending on SchemaType selected
 * @todo really need to find a way to allocate different schema fields with having a 1km wide database table with eleventy thousand fields ...maybe a serialised data field?
 */
class SchemaThing extends DataObject {
	private static $db = array(
	
		// these items are for admin editing/selection
		'CmsSortOrder' => 'Int',
		'CmsChosenSchema' => 'Boolean',
		
		// the selected schema type
		'SchemaType' => 'Varchar(255)',
		
		// schema fields
		'addtionalType' => 'Varchar(255)',
		'alternateName' =>  'Varchar(255)',
		'description' => 'Text',
		'disambiguatingDescription' => 'Text',
		'image' => 'Varchar(255)',
		'mainEntityofPage' => 'Varchar(255)',
		'name' => 'Varchar(255)',
		'sameAs' => 'Varchar(255)',
		'url' => 'Varchar(255)',
	);
	
	private static $has_one = array(
	
		'LinkedDataObject' => 'DataObject', // the item this is linked to
		
		'image' => 'Image',
		'mainEntityofPage' => 'SiteTree',
		'potentionalAction' => 'SchemaThing', // of type SchemaAction
	);
	
	private static $summary_fields = array(
		'ID' => '#',
		'name' => 'Name',
		'alternateName' => 'Alt. Name',
		'description' => 'Description',
	);
	
	private static $searchable_fields = array(
		'name', 'alternateName','description'
	);
	
	public function getCmsFields() {
		$fields = parent::getCmsFields();
		$fields->removeByName('cmsSortOrder');
		
		$fields->renameField('cmsChosenSchema', 'Selected Schema');
		
		$schema_map = array();
		if(!empty($schema_map)) {
			$schema_type_field = new DropdownField('SchemaType', 'Schema Type', $schema_map);
			$fields->addFieldToTab('Root.Main', $schema_type_field, 'Selected Schema');
		}
		
		return $fields;
	}
	
	private function getSchemaMap() {
		$schema_map = array();
		
		return $schema_map;
	}
	
}

// extensions of Thing decorate the Thing and can provide their own templates
class SchemaAction extends DataExtension {}
class SchemaCreativeWork extends DataExtension {}
class SchemaWebPage extends DataExtension {}
class SchemaEvent extends DataExtension {}
class SchemaIntangible extends DataExtension {}
class SchemaOrganization extends DataExtension {}
class SchemaPerson extends DataExtension {}
class SchemaPlace extends DataExtension {}
class SchemaProduct extends DataExtension {}
?>