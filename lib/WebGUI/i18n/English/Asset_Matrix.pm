package WebGUI::i18n::English::Asset_Matrix;

our $I18N = {
        'comparison template help body' => {
                lastUpdated => 0,
                message => q| <p>The following template variables are available in the comparison template.</p>

		<p>
		<b>isTooMany</b><br />
		A condition indicating that the user has selected too many listings to compare. They may only compare Max Comparisons listings at a time.
		</p>

		<p>

		<b>isTooFew</b><br />
		A condition indicating that the user has selected too few listings to compare. They must compare at least two listings.
		</p>

		<p>
		<b>compare.form</b><br />
		The checkbox form that contains all the listings in this matrix.
		</p>

		<p>

		<b>product_loop</b><br />
		A loop containing the product information (not contained in categories) for this listing.
		</p>

		<blockquote>
		<p>
		<b>name</b><br />
		The name of the product.
		</p>

		<p>
		<b>version</b><br />
		The version number or model number of the product.
		</p>

		<p>
		<b>url</b><br />
		The URL to the details page for this listing.
		</p>

		</blockquote>

		<p>
		<b>lastupdated_loop</b><br />
		A loop containing the last updated dates for each listing.
		</p>

		<blockquote>
		<p>
		<b>lastUpdated</b><br />

		The human readable date that this product was last updated.
		</p>
		</blockquote>

		<p>
		<b>category_loop</b><br />
		A loop containing all of the category information for each listing.
		</p>

		<blockquote>

		<p>
		<b>category</b><br />
		The name of the current category.
		</p>

		<p>
		<b>columnCount</b><br />
		The number of products being compared.
		</p>

		<p>
		<b>row_loop</b><br />
		A loop containing the product data for this field in this category. 
		</p>

		<blockquote>
		<p>
		<b>column_loop</b><br />

		A loop containing the value data for this field for this product. The first value in this loop is always the field name.
		</p>

		<blockquote>
		<p>
		<b>value</b><br />
		The value of this field.
		</p>

		<p>

		<b>class</b><br />
		The name of the stylesheet class for this field. it is generated by the value with all the spaces replaced by underscores and all the special characters removed.
		</p>

		<p>
		<b>description</b><br />
		The description for this field.
		</p>
		</blockquote>

		</blockquote>
		</blockquote> |
        },

        'comparison template help title' => {
                lastUpdated => 0,
                message => q|Matrix Comparison Template|
        },

        'detail template help body' => {
                lastUpdated => 0,
                message => q|<p>The following variables are available in the listing detail template.</p>

		<p>
		<b>discussion</b><br />
		The forum attached to this listing.
		</p>
		
		<p>
		<b>email.form</b><br />

		A form to use to send an email to the listing maintainer.
		</p>

		<p>
		<b>email.wasSent</b><br />
		A condition indicating whether an email message was sent or not.
		</p>

		<p>
		<b>edit.url</b><br />

		The URL to the edit page for this listing.
		</p>

		<p>
		<b>user.canEdit</b><br />
		A condition indicating whether the current user has the privileges necessary to edit this listing.
		</p>

		<p>
		<b>user.canApprove</b><br />

		A condition indicating whether the current user has the privileges necessary to approve this listing so it appears on site.
		</p>

		<p>
		<b>approve.url</b><br />
		The URL to approve this listing.
		</p>

		<p>
		<b>delete.url</b><br />

		The URL to delete this listing.
		</p>

		<p>
		<b>isPending</b><br />
		A condition indicating whether this listing has been approved or not.
		</p>

		<p>
		<b>lastUpdated.epoch</b><br />

		The epoch date of when this listing was last updated.
		</p>

		<p>
		<b>lastUpdated.date</b><br />
		A human readable date of when this listing was last updated.
		</p>

		<p>
		<b>id</b><br />

		The unique identifier of this listing.
		</p>

		<p>
		<b>description</b><br />
		The description of this listing.
		</p>

		<p>
		<b>productName</b><br />

		The name of this listing.
		</p>

		<p>
		<b>productUrl</b><br />
		The manufacturer's URL for this listing.
		</p>

		<p>
		<b>productUrl.click</b><br />

		The product URL to use if you want to register the click count for this listing.
		</p>

		<p>
		<b>manufacturerName</b><br />
		The name of the company that manufactuers theproduct or provides the service represented in this listing.
		</p>

		<p>
		<b>manufacturerUrl</b><br />

		The manufacturer's URL.
		</p>

		<p>
		<b>manufacturerUrl.click</b><br />
		The manufacturer URL to use if you want to register the click count for this listing.
		</p>

		<p>
		<b>versionNumber</b><br />

		The version number or model number of this product.
		</p>

		<p>
		<b>views</b><br />
		The total number of views this listing has received.
		</p>

		<p>
		<b>compares</b><br />

		The total number of compares this listing has received.
		</p>

		<p>
		<b>clicks</b><br />
		The total number of clicks this listing has received.
		</p>

		<p>
		<b>ratings</b><br />

		The ratings form (or results) for this listing.
		</p>

		<p>
		<b><i>category</i>_loop</b><br />
		A loop is created for each category in this matrix. The name of the loop is the category name with spaces replaced with hypens and a _loop added to the end. So if you have a category called "Bells and Whistles" then the loop would be called "bells-and-whistles_loop".
		</p>

		<blockquote>
		<p>

		<b>value</b><br />
		The value of this field.
		</p>

		<p>
		<b>name</b><br />
		The name of this field.
		</p>

		<p>

		<b>label</b><br />
		The label of this field.
		</p>

		<p>
		<b>description</b><br />
		The description that tells the user what this field represents.
		</p>

		<p>

		<b>category</b><br />
		The name the category this field is in.
		</p>

		<p>
		<b>class</b><br />
		The stylesheet class name for this field. The class is the field value with spaces replaced with underscores and all non alphanumeric characters removed.
		</p>
		</blockquote>
|
        },

        'detail template help title' => {
                lastUpdated => 0,
                message => q|Matrix Listing Detail Template|
        },

        'matrix template help body' => {
                lastUpdated => 0,
                message => q|<p>The following variables are available in the main Matrix template.</p>

		<p>
		<b>compare.form</b><br />
		The checkbox form that lists all of the comparable items in this matrix.
		</p>

		<p>

		<b>search.url</b><br />
		The URL to the matrix search page.
		</p>

		<p>
		<b>isLoggedIn</b><br />
		A condition indicating whether the current user is logged in to the site.
		</p>

		<p>

		<b>field.list.url</b><br />
		The URL to the page where you configure new fields for this matrix.
		</p>

		<p>
		<b>listing.add.url</b><br />
		The URL to the page where a user can add a new listing to the matrix.
		</p>

		<p>

		<b>best.views.url</b><br />
		The URL to the listing that has the most views.
		</p>

		<p>
		<b>best.views.count</b><br />
		The total number of views of the listing that has the most views.
		</p>

		<p>

		<b>best.views.name</b><br />
		The name of the listing that has the most views.
		</p>

		<p>
		<b>best.compares.url</b><br />
		The URL to the listing that has the most compares.
		</p>

		<p>

		<b>best.compares.count</b><br />
		The number of compares of the listing that has the most compares.
		</p>

		<p>
		<b>best.compares.name</b><br />
		The name of the listing that has the most compares.
		</p>

		<p>

		<b>best.clicks.url</b><br />
		The URL of the listing that has the most clicks.
		</p>

		<p>
		<b>best.clicks.count</b><br />
		The number of clicks of the listing that has the most clicks.
		</p>

		<p>

		<b>best.clicks.name</b><br />
		The name of the listing that has the most clicks.
		</p>

		<p>
		<b>best_rating_loop</b><br />
		A loop containing all of the categories for this matrix and their best ratings.
		</p>

		<blockquote>

		<p>
		<b>url</b><br />
		The URL of the listing that has the best rating for this category.
		</p>

		<p>
		<b>category</b><br />
		The name of this cateogry.
		</p>

		<p>
		<b>name</b><br />
		The name of the listing that has the best rating for this category.
		</p>

		<p>
		<b>mean</b><br />
		The mean (or average) rating of the best listing in this category.
		</p>

		<p>
		<b>median</b><br />
		The median (or middle) rating of the best listing in this category.
		</p>

		<p>
		<b>count</b><br />
		The sum of all the votes of the best listing in this category.
		</p>

		</blockquote>
		
		<p>
		<b>worst_rating_loop</b><br />
		A loop containing all of the categories for this matrix and their worst ratings.
		</p>

		<blockquote>
		<p>
		<b>url</b><br />

		The URL of the listing that has the worst rating for this category.
		</p>

		<p>
		<b>category</b><br />
		The name of this cateogry.
		</p>

		<p>
		<b>name</b><br />

		The name of the listing that has the worst rating for this category.
		</p>

		<p>
		<b>mean</b><br />
		The mean (or average) rating of the worst listing in this category.
		</p>

		<p>
		<b>median</b><br />

		The median (or middle) rating of the worst listing in this category.
		</p>

		<p>
		<b>count</b><br />
		The sum of all the votes of the worst listing in this category.
		</p>
		</blockquote>

		<p>

		<b>ratings.details.url</b><br />
		The URL to the ratings details page.
		</p>

		<p>
		<b>best.posts.url</b><br />
		The URL to the listing that has the most forum posts.
		</p>

		<p>
		<b>best.updated.url</b><br />
		The URL to the listing that was updated most recently.
		</p>

		<p>
		<b>best.updated.date</b><br />
		The date of the most recently updated listing.
		</p>

		<p>

		<b>best.updated.name</b><br />
		The name of the listing that was most recently updated.
		</p>
		
		<p>
		<b>last_update_loop</b><br />
		A loop containing the 20 most recently updated listings.
		<blockquote>
			<p>
			<b>url</b><br />
			The URL to view this listing.
			</p>
			<p>
			<b>name</b><br />
			The name of the product.
			</p>
			<p>
			<b>lastUpdated</b><br />
			The date this listing was updated.
			</p>
		</blockquote>
		</p>

		<p>
		<b>user.count</b><br />
		The total number of registered users on the site.
		</p>

		<p>

		<b>current.user.count</b><br />
		The number of users browsing the site right now.
		</p>

		<p>
		<b>listing.count</b><br />
		The number of listings in this matrix.
		</p>
		
		<p>
		<b>pending_list</b><br />
		A loop containing the list of pending listing.
                <blockquote>
			<p>
			<b>url</b><br />
			The URL to the pending listing.
			</p>
			<p>
                        <b>productName</b><br />
			The product title of the pending listing.	
			</p>
		</blockquote>
		</p> |
        },

        'matrix template help title' => {
                lastUpdated => 0,
                message => q|Matrix Main Template|
        },

        'ratings detail template help title' => {
                lastUpdated => 0,
                message => q|Matrix Ratings Detail Template|
        },

        'ratings detail template help body' => {
                lastUpdated => 0,
                message => q|<p>The following variables are available in the ratings detail template.</p>

		<p>
		<b>rating_loop</b><br />
		This loop contains a list of the categories in this matrix.
		</p>

		<blockquote>

		<p>
		<b>category</b><br />
		The name of the current category.
		</p>

		<p>
		<b>detail_loop</b><br />
		A loop containing a list of listings who have had at least 10 ratings votes and are listed in order by average rating from highest to lowest.
		</p>

		<blockquote>
		<p>
		<b>url</b><br />
		The URL to the detail page for this listing.
		</p>

		<p>
		<b>mean</b><br />

		This listing's mean (or average) rating.
		</p>

		<p>
		<b>median</b><br />
		This listing's median (or middle) rating.
		</p>

		<p>
		<b>count</b><br />

		The total score for this listing.
		</p>

		<p>
		<b>name</b><br />
		The name of this listing.
		</p>
		</blockquote>
		</blockquote> |
        },

        'search template help body' => {
                lastUpdated => 0,
                message => q|<p>The following variables are available in the matrix search template.</p>
		
		<p>
		<b>compare.form</b><br />
		The checkbox form that lists all of the listings in this matrix.
		</p>

		<p>
		<b>form.header</b><br />

		The required header component of the search form.
		</p>

		<p>
		<b>form.footer</b><br />
		The required footer component of the search form.
		</p>

		<p>
		<b>form.submit</b><br />

		The default submit button for the search form.
		</p>

		<p>
		<b><i>category</i>_loop</b><br />
		A loop is created for each category in this matrix. The category name is "<i>category</i>_loop" where category is the name of the category with spaces replaced with hyphens. So if you had a category called "Bells And Whistles" the loop would be called "bells-and-whistles_loop".
		</p>

		<blockquote>

		<p>
		<b>name</b><br />
		The name of the listing.
		</p>

		<p>
		<b>fieldType</b><br />
		The type of field specified for this matrix field.
		</p>

		<p>
		<b>label</b><br />
		The label given to this field that describes what the field represents.
		</p>

		<p>
		<b>description</b><br />
		A description of the field that gives more detail about the field and is used in the hover over tool tips.
		</p>

		<p>
		<b>form</b><br />
		The form element representing this field.
		</p>

		</blockquote>|
        },

        'search template help title' => {
                lastUpdated => 0,
                message => q|Matrix Search Template|
        },

        'add/edit help title' => {
                lastUpdated => 0,
                message => q|Matrix, Add/Edit|
        },

        'add/edit help body' => {
                lastUpdated => 0,
                message => q|<p>The Matrix allows you to set up a really powerful comparison system for any manner of item or service.</p>

		<p>
		<b>Categories</b><br />

		Specify one category per line here to define the categories for this matrix. Categories are used to subdivide fields and also represent the things users can rate each listing on.
		</p>

		<p>
		<b>Detail Template</b><br />
		Select a template to be used to display the detailed information about a listing.
		</p>

		<p>
		<b>Rating Detail Template</b><br />

		Select a template to be used to display the detailed ratings information.
		</p>

		<p>
		<b>Search Template</b><br />
		Select a template to be used to display the search engine interface.
		</p>

		<p>
		<b>Compare Template</b><br />
		Select a template to be used to show the listing comparison data.
		</p>|
        },

	'categories' => {
		message => q|Categories|,
		lastUpdated => 1133758944,
	},

	'max comparisons' => {
		message => q|Maximum Comparisons|,
		lastUpdated => 1133758944,
	},

	'max comparisons privileged' => {
		message => q|Maximum Comparisons (For Privileged Users)|,
		lastUpdated => 1133758944,
	},

	'rating timeout' => {
		message => q|Time Required Between Ratings|,
		lastUpdated => 1133758944,
	},

	'rating timeout privileged' => {
		message => q|Time Required Between Ratings (For Privileged Users)|,
		lastUpdated => 1133758944,
	},

	'group to add' => {
		message => q|Who can add listings?|,
		lastUpdated => 1133758944,
	},

	'privileged group' => {
		message => q|Who should have privileged rights?|,
		lastUpdated => 1133758944,
	},

	'rating group' => {
		message => q|Who can rate listings?|,
		lastUpdated => 1133758944,
	},

	'main template' => {
		message => q|Main Template|,
		lastUpdated => 1133758944,
	},

	'detail template' => {
		message => q|Detail Template|,
		lastUpdated => 1133758944,
	},

	'rating detail template' => {
		message => q|Rating Detail Template|,
		lastUpdated => 1133758944,
	},

	'search template' => {
		message => q|Search Template|,
		lastUpdated => 1133758944,
	},

	'compare template' => {
		message => q|Compare Template|,
		lastUpdated => 1133758944,
	},

	'product name' => {
		message => q|Product Name|,
		lastUpdated => 1133758944,
	},

	'version number' => {
		message => q|Version/Model Number|,
		lastUpdated => 1133758944,
	},

	'manufacturer name' => {
		message => q|Manufacturer Name|,
		lastUpdated => 1133758944,
	},

	'manufacturer url' => {
		message => q|Manufacturer URL|,
		lastUpdated => 1133758944,
	},

	'description' => {
		message => q|Description|,
		lastUpdated => 1133758944,
	},

	'listing maintainer' => {
		message => q|Listing Maintainer|,
		lastUpdated => 1133758944,
	},

	'name' => {
		message => q|Name|,
		lastUpdated => 1133758944,
	},

	'label' => {
		message => q|Label|,
		lastUpdated => 1133758944,
	},

	'type' => {
		message => q|Type|,
		lastUpdated => 1133758944,
	},

	'default value' => {
		message => q|Default Value|,
		lastUpdated => 1133758944,
	},

	'category' => {
		message => q|Category|,
		lastUpdated => 1133758944,
	},

	'your email' => {
		message => q|Your Email Address|,
		lastUpdated => 1133758944,
	},

	'report error' => {
		message => q|Report an error.|,
		lastUpdated => 1133758944,
	},

	'general comment' => {
		message => q|General comment.|,
		lastUpdated => 1133758944,
	},

	'request type' => {
		message => q|Type of Request|,
		lastUpdated => 1133758944,
	},

	'comment' => {
		message => q|Comment|,
		lastUpdated => 1133758944,
	},

	'show ratings' => {
		message => q|Show Ratings|,
		lastUpdated => 1133758944,
	},

	'no copy' => {
		message => q|This asset may not be copied.|,
		lastUpdated => 1133758944,
	},

};

1;
