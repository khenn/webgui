insert into webguiVersion values ('6.3.0','upgrade',unix_timestamp());

UPDATE template set template = '<tmpl_if session.var.adminOn>\n<tmpl_var config.button>\n</tmpl_if>\n<div class=\"synopsis\">\r\n<tmpl_loop page_loop>\r\n   <div class=\"synopsis_title\">\r\n      <a href=\"<tmpl_var page.url>\"><tmpl_var page.menuTitle></a>\r\n   </div>\r\n   <tmpl_if page.indent>\r\n      <div class=\"synopsis_sub\">\r\n         <tmpl_var page.synopsis>\r\n      </div>\r\n   <tmpl_else>\r\n      <div class=\"synopsis_summary\">\r\n         <tmpl_var page.synopsis>\r\n      </div>\r\n   </tmpl_if>\r\n</tmpl_loop>\r\n</div>' where templateId='8' and namespace='Navigation';

delete from template where templateId='tinymce' and namespace='richEditor';
INSERT INTO template VALUES ('tinymce','TinyMCE','^JavaScript(\"<tmpl_var session.config.extrasURL>/tinymce/jscripts/tiny_mce/tiny_mce.js\");\r\n<script language=\"javascript\" type=\"text/javascript\">\r\n	  tinyMCE.init({\r\n    theme : \"advanced\",\r\n    mode : \"specific_textareas\",\r\n    plugins : \"collateral,emotions,insertImage,iespell,pagetree\",\r\n    theme_advanced_buttons2_add : \"insertImage,pagetree,collateral\",     \r\n    theme_advanced_buttons3_add : \"emotions,iespell\"     \r\n  });\r\n</script>\r\n\r\n<tmpl_var textarea>','richEditor',1,1);
delete from template where namespace='style' and templateId='10';
update template set template='^JavaScript(\"<tmpl_var session.config.extrasURL>/tinymce/jscripts/tiny_mce/tiny_mce.js\");\r\n<script language=\"javascript\" type=\"text/javascript\">\r\n	  tinyMCE.init({\r\n    theme : \"advanced\",\r\n    mode : \"specific_textareas\",\r\n    elements : \"elm1,elm2\",\r\n    content_css : \"<tmpl_var session.setting.richEditCss>\",\r\n    extended_valid_elements : \"a[href|target|name]\",\r\n    plugins : \"collateral,emotions,insertImage,iespell,pagetree,table\",\r\n    theme_advanced_buttons2_add : \"insertImage,pagetree,collateral\",     \r\n    theme_advanced_buttons3_add : \"emotions,iespell\"     ,\r\n    theme_advanced_buttons3_add_before : \"tablecontrols,separator\",\r\n    debug : false,\r\nauto_reset_designmode : true \r\n });\r\n</script>\r\n\r\n<tmpl_var textarea>' where templateId='tinymce' and namespace='richEditor';
delete from userProfileField where fieldName='richEditor';
INSERT INTO userProfileField VALUES ('richEditor','WebGUI::International::get(496)',1,0,'selectList','{\'PBtmpl0000000000000126\'=>WebGUI::International::get(880),\r\nnone=>WebGUI::International::get(881),\r\n\'PBtmpl0000000000000138\'=>WebGUI::International::get(\"tinymce\")\n}','[\'PBtmpl0000000000000138\']',11,'4',0,1);
update userProfileData set fieldData='PBtmpl0000000000000138' where fieldName='richEditor';

INSERT INTO template VALUES ('adminConsole','Admin Console','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\r\n        \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n        <title>WebGUI <tmpl_var session.webgui.version>-<tmpl_var session.webgui.status> Admin Console</title>\r\n        <tmpl_var head.tags> \r\n</head>\r\n<body>\r\n<tmpl_var body.content>\r\n</body>\r\n</html>\r\n','style',1,0);
delete from settings where name='adminStyleId';
delete from settings where name='useAdminStyle';


ALTER TABLE SQLReport CHANGE preprocessMacros preprocessMacros1 INT DEFAULT 0;
ALTER TABLE SQLReport CHANGE dbQuery dbQuery1 TEXT;
ALTER TABLE SQLReport CHANGE databaseLinkId  databaseLinkId1 varchar(22) DEFAULT NULL;
ALTER TABLE SQLReport ADD placeholderParams1 TEXT;

ALTER TABLE SQLReport ADD preprocessMacros2 INT DEFAULT 0;
ALTER TABLE SQLReport ADD dbQuery2 TEXT;
ALTER TABLE SQLReport ADD placeholderParams2 TEXT;
ALTER TABLE SQLReport ADD databaseLinkId2 VARCHAR(22);

ALTER TABLE SQLReport ADD preprocessMacros3 INT DEFAULT 0;
ALTER TABLE SQLReport ADD dbQuery3 TEXT;
ALTER TABLE SQLReport ADD placeholderParams3 TEXT;
ALTER TABLE SQLReport ADD databaseLinkId3 VARCHAR(22);

ALTER TABLE SQLReport ADD preprocessMacros4 INT DEFAULT 0;
ALTER TABLE SQLReport ADD dbQuery4 TEXT;
ALTER TABLE SQLReport ADD placeholderParams4 TEXT;
ALTER TABLE SQLReport ADD databaseLinkId4 VARCHAR(22);

ALTER TABLE SQLReport ADD preprocessMacros5 INT DEFAULT 0;
ALTER TABLE SQLReport ADD dbQuery5 TEXT;
ALTER TABLE SQLReport ADD placeholderParams5 TEXT;
ALTER TABLE SQLReport ADD databaseLinkId5 VARCHAR(22);

UPDATE template set template = '<tmpl_if displayTitle>\r\n    <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n    <tmpl_var description><p />\r\n</tmpl_if>\r\n\r\n<tmpl_if debugMode>\r\n	<ul>\r\n	<tmpl_loop debug_loop>\r\n		<li><tmpl_var debug.output></li>\r\n	</tmpl_loop>\r\n	</ul>\r\n</tmpl_if>\r\n\r\n<table width=\"100%\" cellspacing=0 cellpadding=0 style=\"border: 1px solid black;\">\r\n<tr>\r\n   <tmpl_loop columns_loop>\r\n	<td class=\"tableHeader\"><tmpl_var column.name></td>\r\n   </tmpl_loop>\r\n</tr>\r\n\r\n<tmpl_loop rows_loop>\r\n   <tr>\r\n   <tmpl_loop row.field_loop>\r\n	<td class=\"tableData\"><tmpl_var field.value></td>\r\n   </tmpl_loop>\r\n   </tr>\r\n   <!-- Handle nested query2 -->\r\n   <tmpl_if hasNest>\r\n	<tr>\r\n	<td colspan=\"<tmpl_var columns.count>\">\r\n	<table width=\"100%\" cellspacing=0 cellpadding=0>\r\n	<tr>\r\n	<td width=\"20\">\r\n	   &nbsp;\r\n	</td>\r\n	<td>\r\n	   <table width=\"100%\" cellspacing=0 cellpadding=0 style=\"border: 1px solid black;\">\r\n	   <tr>\r\n	   <tmpl_loop query2.columns_loop>\r\n		<td class=\"tableHeader\"><tmpl_var column.name></td>\r\n	   </tmpl_loop>\r\n	   </tr>\r\n	   <tmpl_loop query2.rows_loop>\r\n	   <tr>\r\n	   <tmpl_loop query2.row.field_loop>\r\n		<td class=\"tableData\"><tmpl_var field.value></td>\r\n	   </tmpl_loop>\r\n	   </tr>\r\n	   <!-- Handle nested query3 -->\r\n	   <tmpl_if query2.hasNest>\r\n		<tr>\r\n		<td colspan=\"<tmpl_var query2.columns.count>\">\r\n		<table width=\"100%\" cellspacing=0 cellpadding=0>\r\n		<tr>\r\n		<td width=\"20\">\r\n		   &nbsp;\r\n		</td>\r\n		<td>\r\n		   <table width=\"100%\" cellspacing=0 cellpadding=0 style=\"border: 1px solid black;\">\r\n		   <tr>\r\n		   <tmpl_loop query3.columns_loop>\r\n			<td class=\"tableHeader\"><tmpl_var column.name></td>\r\n		   </tmpl_loop>\r\n		   </tr>\r\n		   <tmpl_loop query3.rows_loop>\r\n		   <tr>\r\n		   <tmpl_loop query3.row.field_loop>\r\n			<td class=\"tableData\"><tmpl_var field.value></td>\r\n		   </tmpl_loop>\r\n		   </tr>\r\n	   		<!-- Handle nested query4 -->\r\n			   <tmpl_if query3.hasNest>\r\n				<tr>\r\n				<td colspan=\"<tmpl_var query3.columns.count>\">\r\n				<table width=\"100%\" cellspacing=0 cellpadding=0>\r\n				<tr>\r\n				<td width=\"20\">\r\n				   &nbsp;\r\n				</td>\r\n				<td>\r\n				   <table width=\"100%\" cellspacing=0 cellpadding=0 style=\"border: 1px solid black;\">\r\n				   <tr>\r\n				   <tmpl_loop query4.columns_loop>\r\n					<td class=\"tableHeader\"><tmpl_var column.name></td>\r\n				   </tmpl_loop>\r\n				   </tr>\r\n				   <tmpl_loop query4.rows_loop>\r\n				   <tr>\r\n				   <tmpl_loop query4.row.field_loop>\r\n					<td class=\"tableData\"><tmpl_var field.value></td>\r\n				   </tmpl_loop>\r\n			   		<!-- Handle nested query5 -->\r\n					   <tmpl_if query4.hasNest>\r\n						<tr>\r\n						<td colspan=\"<tmpl_var query4.columns.count>\">\r\n						<table width=\"100%\" cellspacing=0 cellpadding=0>\r\n						<tr>\r\n						<td width=\"20\">\r\n						   &nbsp;\r\n						</td>\r\n						<td>\r\n						   <table width=\"100%\" cellspacing=0 cellpadding=0 style=\"border: 1px solid black;\">\r\n						   <tr>\r\n						   <tmpl_loop query5.columns_loop>\r\n							<td class=\"tableHeader\"><tmpl_var column.name></td>\r\n						   </tmpl_loop>\r\n						   </tr>\r\n						   <tmpl_loop query5.rows_loop>\r\n						   <tr>\r\n						   <tmpl_loop query5.row.field_loop>\r\n							<td class=\"tableData\"><tmpl_var field.value></td>\r\n						   </tmpl_loop>\r\n						   </tr>\r\n						   </tmpl_loop>\r\n						   </table>\r\n						</td>\r\n						</tr>\r\n						</table>\r\n					        </td>\r\n			        		</tr>\r\n					   </tmpl_if>\r\n				   </tr>\r\n				   </tmpl_loop>\r\n				   </table>\r\n				</td>\r\n				</tr>\r\n				</table>\r\n			        </td>\r\n			        </tr>\r\n			   </tmpl_if>\r\n		   </tmpl_loop>\r\n		   </table>\r\n		</td>\r\n		</tr>\r\n		</table>\r\n	        </td>\r\n	        </tr>\r\n	   </tmpl_if>\r\n	   </tmpl_loop>\r\n	   </table>\r\n	</td>\r\n	</tr>\r\n	</table>\r\n   </td>\r\n</tr>\r\n</tmpl_if>\r\n</tmpl_loop>\r\n</table>\r\n\r\n<tmpl_if pagination.pageCount.isMultiple>\r\n  <div class=\"pagination\">\r\n    <tmpl_var pagination.previousPage>   <tmpl_var pagination.pageList.upTo20>  <tmpl_var pagination.nextPage>\r\n  </div>\r\n</tmpl_if>' where templateId="1" and namespace="SQLReport";

create table asset (
	assetId varchar(22) not null primary key,
	parentId varchar(22) not null,
	lineage varchar(255) not null,
	state varchar(35) not null,
	className varchar(255) not null,
	title varchar(255) not null default 'untitled',
	menuTitle varchar(255) not null default 'untitled',
	url varchar(255) not null,
	startDate bigint not null default 997995720,
	endDate bigint not null default 9223372036854775807,
	ownerUserId varchar(22) not null,
	groupIdView varchar(22) not null,
	groupIdEdit varchar(22) not null,
	synopsis text,
	newWindow int not null default 0,
	isHidden int not null default 0,
	isSystem int not null default 0,
	encryptPage int not null default 0,
	assetSize int not null default 0,
	lastUpdated bigint not null default 0,
	lastUpdatedBy varchar(22),
	isPackage int not null default 0,
	extraHeadTags text,
	unique index (lineage asc),
	unique index (url),
	index (parentId)
);

insert into asset (assetId, parentId, lineage, state, className, title, menuTitle, url, isSystem, ownerUserId, groupIdView, groupIdEdit, isHidden) values ('PBasset000000000000001', 'infinity', '000001','published','WebGUI::Asset','Root','Root','root',1,'3','3','3',1);
insert into asset (assetId, parentId, lineage, state, className, title, menuTitle, url, isSystem, ownerUserId, groupIdView, groupIdEdit, isHidden) values ('PBasset000000000000002', 'PBasset000000000000001', '000001000001','published','WebGUI::Asset::Wobject::Folder','Import Node','Import','root/import',1,'3','3','3',1);

create table assetHistory (
	assetId varchar(22) not null,
	userId varchar(22) not null,
	dateStamp bigint not null default 0,
	actionTaken varchar(255) not null
);

create table redirect (
	assetId varchar(22) not null primary key,
	redirectUrl text
);

create table snippet (
	assetId varchar(22) not null primary key,
	snippet mediumtext
);

create table Layout (
	assetId varchar(22) not null primary key,
	templateId varchar(22) not null,
	contentPositions text
);

create table Folder (
	assetId varchar(22) not null primary key,
	templateId varchar(22) not null
);


create table FileAsset (
	assetId varchar(22) not null primary key, 
	storageId varchar(22) not null, 
	filename varchar(255) not null, 
	olderVersions text
);

INSERT INTO settings VALUES ('commerceCheckoutCanceledTemplateId','1');
INSERT INTO settings VALUES ('commerceConfirmCheckoutTemplateId','1');
INSERT INTO settings VALUES ('commercePaymentPlugin','PayFlowPro');
INSERT INTO settings VALUES ('commerceSelectPaymentGatewayTemplateId','1');
INSERT INTO settings VALUES ('commerceTransactionErrorTemplateId','1');
INSERT INTO template VALUES ('1','Subscription code redemption','<tmpl_if batchDescription>\r\nBatch: <tmpl_var batchDescription>\r\n</tmpl_if>\r\n\r\n<tmpl_var message><br>\r\n<tmpl_var codeForm>','Operation/RedeemSubscription',1,1);
INSERT INTO template VALUES ('1','Subscriptionitem default template','<h2><tmpl_var name></h2>\r\n<tmpl_var description><br>\r\n<br>\r\n<br>\r\n$ <tmpl_var price><br>\r\n<a href=\"<tmpl_var url>\">Subscribe now</a><br>','Macro/SubscriptionItem',1,1);
INSERT INTO template VALUES ('1','Default transaction error template','<table border=\"1\" cellpadding=\"5\" cellspacing=\"0\">\r\n  <tr>\r\n    <th>Transaction description</th>\r\n    <th>Price</th>\r\n    <th>Status</th>\r\n    <th>Error</th>\r\n  </tr>\r\n<tmpl_loop resultLoop>\r\n  <tr>\r\n    <td align=\"left\"><tmpl_var purchaseDescription></td>\r\n    <td align=\"right\"><tmpl_var purchaseAmount></td>\r\n    <td><tmpl_var status></td>\r\n    <td align=\"left\"><tmpl_var error> (<tmpl_var errorCode>)</td>\r\n  </tr>\r\n</tmpl_loop>\r\n</table><br>\r\n<br>\r\n\r\n<tmpl_var statusExplanation>','Commerce/TransactionError',1,1);
INSERT INTO template VALUES ('1','Default checkout confirmation template','<tmpl_var title><br>\r\n<br>\r\n<ul>\r\n<tmpl_loop errorLoop>\r\n<li><tmpl_var message></li>\r\n</tmpl_loop>\r\n</ul>\r\n\r\n<tmpl_if recurringItems>\r\n<table border=\"0\" cellpadding=\"5\">\r\n<tmpl_loop recurringLoop>\r\n  <tr>\r\n    <td align=\"left\"><b>Subscription \"<tmpl_var name>\"</b></td>\r\n    <td> : </td>\r\n    <td align=\"left\">$ <tmpl_var price> every <tmpl_var period></td>\r\n  </tr>\r\n</tmpl_loop>\r\n</table><br>\r\n<br>\r\n</tmpl_if>\r\n<tmpl_var form>','Commerce/ConfirmCheckout',1,1);
INSERT INTO template VALUES ('1','Default view purchase history template','<table border=\"0\">\r\n<tmpl_loop purchaseHistoryLoop>\r\n	<tr>\r\n		<td><b><tmpl_var initDate></b></td>\r\n		<td><b><tmpl_var completionDate></b></td>\r\n		<td align=\"right\"><b>$ <tmpl_var amount></b></td>\r\n		<td><b><tmpl_var status></b></td>\r\n		<td><tmpl_if canCancel><a href=\"<tmpl_var cancelUrl>\">Cancel</a></tmpl_if></td>\r\n	</tr>\r\n	<tmpl_loop itemLoop>\r\n	<tr>\r\n		<td \"align=right\"><tmpl_var quantity> x </td>\r\n		<td \"align=left\"><tmpl_var itemName></td>\r\n		<td \"align=right\">$ <tmpl_var amount></td>\r\n	</tr>\r\n	</tmpl_loop>\r\n</tmpl_loop>\r\n</table>','Commerce/ViewPurchaseHistory',1,1);
INSERT INTO template VALUES ('1','Default cancel checkout template','<tmpl_var message>','Commerce/CheckoutCanceled',1,1);
CREATE TABLE shoppingCart (
  sessionId varchar(22) NOT NULL default '',
  itemId varchar(64) NOT NULL default '',
  itemType varchar(40) NOT NULL default '',
  quantity int(4) NOT NULL default '0',
  PRIMARY KEY  (sessionId,itemId,itemType)
) TYPE=MyISAM;
CREATE TABLE subscription (
  subscriptionId varchar(22) NOT NULL default '',
  name varchar(128) default NULL,
  price float default '0',
  description mediumtext,
  subscriptionGroup varchar(22) NOT NULL default '',
  duration varchar(12) NOT NULL default 'Monthly',
  executeOnSubscription varchar(128) default NULL,
  karma int(4) default '0',
  deleted int(1) default '0',
  PRIMARY KEY  (subscriptionId)
) TYPE=MyISAM;
CREATE TABLE subscriptionCodeBatch (
  batchId varchar(22) NOT NULL default '',
  name varchar(128) default NULL,
  description mediumtext NOT NULL,
  subscriptionId varchar(22) NOT NULL default '',
  PRIMARY KEY  (batchId)
) TYPE=MyISAM;
CREATE TABLE subscriptionCode (
  batchId varchar(22) NOT NULL default '',
  code varchar(64) NOT NULL default '',
  status varchar(10) NOT NULL default 'Unused',
  dateCreated int(11) NOT NULL default '0',
  dateUsed int(11) NOT NULL default '0',
  expires int(11) NOT NULL default '0',
  usedBy varchar(22) NOT NULL default '0',
  PRIMARY KEY  (code)
) TYPE=MyISAM;
CREATE TABLE subscriptionCodeSubscriptions (
  code varchar(64) NOT NULL default '',
  subscriptionId varchar(22) NOT NULL default '',
  UNIQUE KEY code (code,subscriptionId)
) TYPE=MyISAM;
CREATE TABLE transaction (
  transactionId varchar(22) NOT NULL default '',
  userId varchar(22) NOT NULL default '',
  amount float NOT NULL default '0',
  gatewayId varchar(128) default NULL,
  gateway varchar(64) NOT NULL default '',
  recurring tinyint(1) NOT NULL default '0',
  initDate int(11) NOT NULL default '0',
  completionDate int(11) default '0',
  status varchar(10) NOT NULL default 'Pending',
  lastPayedTerm int(6) NOT NULL default '0',
  PRIMARY KEY  (transactionId)
) TYPE=MyISAM;
CREATE TABLE transactionItem (
  transactionId varchar(22) NOT NULL default '',
  itemName varchar(64) NOT NULL default '',
  amount float NOT NULL default '0',
  quantity int(4) NOT NULL default '0',
  itemId varchar(64) NOT NULL default '',
  itemType varchar(40) NOT NULL default ''
) TYPE=MyISAM;
CREATE TABLE commerceSettings (
  fieldName varchar(64) NOT NULL default '',
  fieldValue varchar(255) NOT NULL default '',
  namespace varchar(64) NOT NULL default '',
  type varchar(10) NOT NULL default ''
) TYPE=MyISAM;
create table ITransact_recurringStatus (
	gatewayId	varchar(128) not null primary key,
	initDate	int(11) not null,
	lastTransaction int(11) not null,
	status		varchar(10) not null,
	errorMessage	varchar(128),
	recipe		varchar(15) not null
);
INSERT INTO template VALUES ('1','Default payment gateway selection template','<tmpl_if pluginsAvailable>\r\n   <tmpl_var message><br>\r\n    <tmpl_var formHeader>\r\n       <table border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\r\n    <tmpl_loop pluginLoop>\r\n            <tr>\r\n                        <td><tmpl_var formElement></td>\r\n                     <td align=\"left\"><tmpl_var name></td>\r\n           </tr>\r\n       </tmpl_loop>\r\n        </table>\r\n    <tmpl_var formSubmit>\r\n    <tmpl_var formFooter>\r\n<tmpl_else>\r\n <tmpl_var noPluginsMessage>\r\n</tmpl_if>','Commerce/SelectPaymentGateway',1,1);


create table ImageAsset (
	assetId varchar(22) not null primary key,
	thumbnailSize int not null default 50,
	parameters text
);

INSERT INTO template VALUES ('1','Admin Console','^StyleSheet(^Extras;/adminConsole/adminConsole.css);\r\n^JavaScript(^Extras;/adminConsole/adminConsole.js);\r\n\r\n<div id=\"application_help\">\r\n  <tmpl_if help.url>\r\n    <a href=\"<tmpl_var help.url>\" target=\"_blank\"><img src=\"^Extras;/adminConsole/small/help.gif\" alt=\"?\" border=\"0\" /></a>\r\n  </tmpl_if>\r\n</div>\r\n<div id=\"application_icon\">\r\n    <img src=\"<tmpl_var application.icon>\" border=\"0\" title=\"<tmpl_var application.title>\" alt=\"<tmpl_var application.title>\" />\r\n</div>\r\n<div class=\"adminConsoleTitleIconMedalian\">\r\n<img src=\"^Extras;/adminConsole/medalian.gif\" border=\"0\" alt=\"*\" />\r\n</div>\r\n<div id=\"console_icon\">\r\n     <img src=\"<tmpl_var console.icon>\" border=\"0\" title=\"<tmpl_var console.title>\" alt=\"<tmpl_var console.title>\" />\r\n</div>\r\n<div id=\"application_title\">\r\n       <tmpl_var application.title>\r\n</div>\r\n<div id=\"console_title\">\r\n       <tmpl_var console.title>\r\n</div>\r\n<div id=\"application_workarea\">\r\n       <tmpl_var application.workArea>\r\n</div>\r\n<div id=\"console_workarea\">\r\n        <div class=\"adminConsoleSpacer\">\r\n            &nbsp;\r\n        </div>\r\n        <tmpl_loop application_loop>\r\n                <tmpl_if canUse>\r\n                     <div class=\"adminConsoleApplication\">\r\n                           <a href=\"<tmpl_var url>\"><img src=\"<tmpl_var icon>\" border=\"0\" title=\"<tmpl_var title>\" alt=\"<tmpl_var title>\" /></a><br />\r\n                           <a href=\"<tmpl_var url>\"><tmpl_var title></a>\r\n                     </div>\r\n               </tmpl_if>\r\n       </tmpl_loop>\r\n        <div class=\"adminConsoleSpacer\">\r\n            &nbsp;\r\n        </div>\r\n</div>\r\n<div class=\"adminConsoleMenu\">\r\n        <div id=\"adminConsoleMainMenu\" class=\"adminConsoleMainMenu\">\r\n                <div id=\"console_toggle_on\">\r\n                        <a href=\"#\" onClick=\"toggleAdminConsole()\"><tmpl_var toggle.on.label></a><br />\r\n                </div>\r\n                <div id=\"console_toggle_off\">\r\n                        <a href=\"#\" onClick=\"toggleAdminConsole()\"><tmpl_var toggle.off.label></a><br />\r\n                </div>\r\n        </div>\r\n        <div id=\"adminConsoleApplicationSubmenu\"  class=\"adminConsoleApplicationSubmenu\">\r\n              <tmpl_loop submenu_loop>\r\n                        <a href=\"<tmpl_var url>\" <tmpl_var extras>><tmpl_var label></a><br />\r\n              </tmpl_loop>\r\n        </div>\r\n        <div id=\"adminConsoleUtilityMenu\" class=\"adminConsoleUtilityMenu\">\r\n                <a href=\"^\\;\"><tmpl_var backtosite.label></a><br />\r\n                ^AdminToggle;<br />\r\n                ^LoginToggle;<br />\r\n        </div>\r\n</div>\r\n<script lang=\"JavaScript\">\r\n  initAdminConsole(<tmpl_if application.title>true<tmpl_else>false</tmpl_if>,<tmpl_if submenu_loop>true<tmpl_else>false</tmpl_if>);\r\n</script>\r\n','AdminConsole',1,1);
insert into settings (name,value) values ('AdminConsoleTemplate',"PBtmpl0000000000000001");
delete from template where namespace='Macro/AdminBar' and templateId in ('1','2');
INSERT INTO template VALUES ('1','Default Admin Bar','<script language=\"JavaScript\" type=\"text/javascript\">   <!--\r\n        function goContent(){\r\n                location = document.content.contentSelect.options[document.content.contentSelect.selectedIndex].value\r\n        }\r\n        function goAdmin(){\r\n                location = document.admin.adminSelect.options[document.admin.adminSelect.selectedIndex].value\r\n        }\r\n        //-->   </script>\r\n \r\n<div class=\"adminBar\">\r\n<table class=\"adminBar\" cellpadding=\"3\" cellspacing=\"0\" border=\"0\">\r\n	<tr>\r\n        		<form name=\"content\"> <td>\r\n<select name=\"contentSelect\" onChange=\"goContent()\">\r\n<option value=\"\"><tmpl_var addcontent.label></option>\r\n\r\n<tmpl_if clipboard_loop>\r\n<optgroup label=\"<tmpl_var clipboard.label>\">	\r\n<tmpl_loop clipboard_loop>\r\n<option value=\"<tmpl_var clipboard.url>\"><tmpl_var clipboard.label></option>\r\n</tmpl_loop>\r\n</optgroup>\r\n</tmpl_if>\r\n<tmpl_loop container_loop> <option value=\"<tmpl_var container.url>\"><tmpl_var container.label></option> </tmpl_loop>\r\n<tmpl_if contentTypes_loop>\r\n<optgroup label=\"<tmpl_var contentTypes.label>\">	\r\n<tmpl_loop contentTypes_loop>\r\n<option value=\"<tmpl_var contentType.url>\"><tmpl_var contentType.label></option>\r\n</tmpl_loop>\r\n</optgroup>\r\n</tmpl_if>\r\n\r\n<tmpl_if package_loop>\r\n<optgroup label=\"<tmpl_var packages.label>\">	\r\n<tmpl_loop package_loop>\r\n<option value=\"<tmpl_var package.url>\"><tmpl_var package.label></option>\r\n</tmpl_loop>\r\n</optgroup>\r\n</tmpl_if>\r\n\r\n</select>\r\n		</td> </form>\r\n\r\n        		<form name=\"admin\"> <td align=\"center\">\r\n			<select name=\"adminSelect\" onChange=\"goAdmin()\">\r\n				<option value=\"\"><tmpl_var admin.label></option>\r\n				<tmpl_loop admin_loop>\r\n					<option value=\"<tmpl_var admin.url>\"><tmpl_var admin.label></option>\r\n				</tmpl_loop>\r\n			</select>\r\n		</td> </form>\r\n        	</tr>\r\n</table>\r\n</div>\r\n','Macro/AdminBar',1,1);
INSERT INTO template VALUES ('2','DHTML Admin Bar','^JavaScript(\"<tmpl_var session.config.extrasURL>/coolmenus/coolmenus4.js\");\r\n<style type=\"text/css\">\r\n                                                                                                                                                          \r\n.adminBarTop,.adminBarTopOver,.adminBarSub,.adminBarSubOver{position:absolute; overflow:hidden; cursor:pointer; cursor:hand}\r\n.adminBarTop,.adminBarTopOver{padding:4px; font-size:12px; font-weight:bold}\r\n.adminBarTop{color:white; border: 1px solid #aaaaaa; }\r\n.adminBarTopOver,.adminBarSubOver{color:#EC4300;}\r\n.adminBarSub,.adminBarSubOver{padding:2px; font-size:11px; font-weight:bold}\r\n.adminBarSub{color: white; background-color: #666666; layer-background-color: #666666;}\r\n.adminBarSubOver,.adminBarSubOver,.adminBarBorder,.adminBarBkg{layer-background-color: black; background-color: black;}\r\n.adminBarBorder{position:absolute; visibility:hidden; z-index:300}\r\n.adminBarBkg{position:absolute; width:10; height:10; visibility:hidden; }\r\n</style>\r\n\r\n<script language=\"JavaScript1.2\">\r\n/*****************************************************************************\r\nCopyright (c) 2001 Thomas Brattli (webmaster@dhtmlcentral.com)\r\n                                                                                                                                                             \r\nDHTML coolMenus - Get it at coolmenus.dhtmlcentral.com\r\nVersion 4.0_beta\r\nThis script can be used freely as long as all copyright messages are\r\nintact.\r\n                                                                                                                                                             \r\nExtra info - Coolmenus reference/help - Extra links to help files ****\r\nCSS help: http://192.168.1.31/projects/coolmenus/reference.asp?m=37\r\nGeneral: http://coolmenus.dhtmlcentral.com/reference.asp?m=35\r\nMenu properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=47\r\nLevel properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=48\r\nBackground bar properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=49\r\nItem properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=50\r\n******************************************************************************/\r\nadminBar=new makeCM(\"adminBar\"); \r\n\r\n//menu properties\r\nadminBar.resizeCheck=1; \r\nadminBar.rows=1;  \r\nadminBar.onlineRoot=\"\"; \r\nadminBar.pxBetween =0;\r\nadminBar.fillImg=\"\"; \r\nadminBar.fromTop=0; \r\nadminBar.fromLeft=30; \r\nadminBar.wait=600; \r\nadminBar.zIndex=10000;\r\nadminBar.menuPlacement=\"left\";\r\n\r\n//background bar properties\r\nadminBar.useBar=1; \r\nadminBar.barWidth=\"\"; \r\nadminBar.barHeight=\"menu\"; \r\nadminBar.barX=0;\r\nadminBar.barY=\"menu\"; \r\nadminBar.barClass=\"adminBarBkg\";\r\nadminBar.barBorderX=0; \r\nadminBar.barBorderY=0;\r\n\r\nadminBar.level[0]=new cm_makeLevel(160,20,\"adminBarTop\",\"adminBarTopOver\",1,1,\"adminBarBorder\",0,\"bottom\",0,0,0,0,0);\r\nadminBar.level[1]=new cm_makeLevel(160,18,\"adminBarSub\",\"adminBarSubOver\",1,1,\"adminBarBorder\",0,\"right\",0,5,\"menu_arrow.gif\",10,10);\r\n\r\n\r\nadminBar.makeMenu(\'addcontent\',\'\',\'<tmpl_var addcontent.label>\',\'\');\r\n\r\n<tmpl_if clipboard_loop>\r\nadminBar.makeMenu(\'clipboard\',\'addcontent\',\'<tmpl_var clipboard.label> &raquo;\',\'\');\r\n<tmpl_loop clipboard_loop> \r\n	adminBar.makeMenu(\'clipboard<tmpl_var __counter__>\',\'clipboard\',\'<tmpl_var clipboard.label>\',\'<tmpl_var clipboard.url>\');\r\n</tmpl_loop>\r\n</tmpl_if>\r\n<tmpl_loop container_loop> adminBar.makeMenu(\'container<tmpl_var __counter__>\',\'addcontent\',\'<tmpl_var container.label>\',\'<tmpl_var container.url>\'); </tmpl_loop>\r\n<tmpl_if contentTypes_loop>\r\nadminBar.makeMenu(\'contentTypes\',\'addcontent\',\'<tmpl_var contentTypes.label> &raquo;\',\'\');\r\n<tmpl_loop contentTypes_loop> \r\n	adminBar.makeMenu(\'contentTypes<tmpl_var __counter__>\',\'contentTypes\',\'<tmpl_var contentType.label>\',\'<tmpl_var contentType.url>\');\r\n</tmpl_loop>\r\n</tmpl_if>\r\n\r\n<tmpl_if package_loop>\r\n<tmpl_if packages.canAdd>\r\nadminBar.makeMenu(\'packages\',\'addcontent\',\'<tmpl_var packages.label> &raquo;\',\'\');\r\n<tmpl_loop package_loop> \r\n	adminBar.makeMenu(\'package<tmpl_var __counter__>\',\'packages\',\'<tmpl_var package.label>\',\'<tmpl_var package.url>\');\r\n</tmpl_loop>\r\n</tmpl_if>\r\n</tmpl_if>\r\n\r\n\r\nadminBar.makeMenu(\'admin\',\'\',\'<tmpl_var admin.label>\',\'\');\r\n<tmpl_loop admin_loop> \r\n	adminBar.makeMenu(\'admin<tmpl_var admin.count>\',\'admin\',\'<tmpl_var admin.label>\',\'<tmpl_var admin.url>\');\r\n</tmpl_loop>\r\n \r\nadminBar.construct()\r\n</script>\r\n','Macro/AdminBar',1,1);

delete from template where namespace='page' and templateId in ('1','2','3','4','5','6','7');

INSERT INTO template VALUES ('5','Left Column','<a href=\"<tmpl_var assetId>\"></a>\r\n\r\n<tmpl_if displayTitle>\r\n  <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n<p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<div>\r\n<!-- begin position 1 -->\r\n<div style=\"width: 34%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position1\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position1_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 1 -->\r\n\r\n<!-- begin position 2 -->\r\n<div style=\"width: 66%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position2\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position2_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 2 -->\r\n</div>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<tmpl_if showAdmin> \r\n	<table><tr id=\"blank\" class=\"hidden\"><td><div><div class=\"empty\">&nbsp;</div></div></td></tr></table>\r\n            <tmpl_var dragger.init>\r\n</tmpl_if>\r\n		','page',1,1);
INSERT INTO template VALUES ('4','Three Over One','<a href=\"<tmpl_var assetId>\"></a>\r\n\r\n<tmpl_if displayTitle>\r\n  <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n<p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<div>\r\n<!-- begin position 1 -->\r\n<div style=\"width: 33%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position1\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position1_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 1 -->\r\n\r\n\r\n<!-- begin position 2 -->\r\n<div style=\"width: 34%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position2\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position2_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 2 -->\r\n\r\n<!-- begin position 3 -->\r\n<div style=\"width: 33%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position3\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position3_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 3 -->\r\n\r\n</div>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<!-- begin position 4 -->\r\n<div>\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position4\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position4_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 4 -->\r\n\r\n\r\n\r\n<tmpl_if showAdmin> \r\n	<table><tr id=\"blank\" class=\"hidden\"><td><div><div class=\"empty\">&nbsp;</div></div></td></tr></table>\r\n            <tmpl_var dragger.init>\r\n</tmpl_if>\r\n		','page',1,1);
INSERT INTO template VALUES ('3','One Over Three','<a href=\"<tmpl_var assetId>\"></a>\r\n\r\n<tmpl_if displayTitle>\r\n  <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n<p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<!-- begin position 1 -->\r\n<div>\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position1\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position1_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 1 -->\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<div>\r\n<!-- begin position 2 -->\r\n<div style=\"width: 33%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position2\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position2_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 2 -->\r\n\r\n<!-- begin position 3 -->\r\n<div style=\"width: 34%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position3\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position3_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 3 -->\r\n\r\n\r\n<!-- begin position 4 -->\r\n<div style=\"width: 33%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position4\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position4_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 4 -->\r\n\r\n</div>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n\r\n<tmpl_if showAdmin> \r\n	<table><tr id=\"blank\" class=\"hidden\"><td><div><div class=\"empty\">&nbsp;</div></div></td></tr></table>\r\n            <tmpl_var dragger.init>\r\n</tmpl_if>\r\n		','page',1,1);
INSERT INTO template VALUES ('2','News','<a href=\"<tmpl_var assetId>\"></a>\r\n\r\n<tmpl_if displayTitle>\r\n  <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n<p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<!-- begin position 1 -->\r\n<div>\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position1\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position1_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 1 -->\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<div>\r\n<!-- begin position 2 -->\r\n<div style=\"width: 50%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position2\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position2_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 2 -->\r\n\r\n<!-- begin position 3 -->\r\n<div style=\"width: 50%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position3\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position3_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 3 -->\r\n</div>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n\r\n<!-- begin position 4 -->\r\n<div>\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position4\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position4_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 4 -->\r\n\r\n\r\n\r\n\r\n<tmpl_if showAdmin> \r\n	<table><tr id=\"blank\" class=\"hidden\"><td><div><div class=\"empty\">&nbsp;</div></div></td></tr></table>\r\n            <tmpl_var dragger.init>\r\n</tmpl_if>\r\n		','page',1,1);
INSERT INTO template VALUES ('7','Side By Side','<a href=\"<tmpl_var assetId>\"></a>\r\n\r\n<tmpl_if displayTitle>\r\n  <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n<p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<div>\r\n<!-- begin position 1 -->\r\n<div style=\"width: 50%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position1\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position1_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 1 -->\r\n\r\n<!-- begin position 2 -->\r\n<div style=\"width: 50%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position2\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position2_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 2 -->\r\n</div>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n\r\n<tmpl_if showAdmin> \r\n	<table><tr id=\"blank\" class=\"hidden\"><td><div><div class=\"empty\">&nbsp;</div></div></td></tr></table>\r\n            <tmpl_var dragger.init>\r\n</tmpl_if>\r\n		','page',1,1);
INSERT INTO template VALUES ('6','Right Column','<a href=\"<tmpl_var assetId>\"></a>\r\n\r\n<tmpl_if displayTitle>\r\n  <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n<p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n<div>\r\n<!-- begin position 1 -->\r\n<div style=\"width: 66%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position1\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position1_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 1 -->\r\n\r\n<!-- begin position 2 -->\r\n<div style=\"width: 34%; float: left;\">\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position2\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position2_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n</div>\r\n<!-- end position 2 -->\r\n</div>\r\n\r\n<div style=\"clear: both;\">&nbsp;</div>\r\n\r\n\r\n<tmpl_if showAdmin> \r\n	<table><tr id=\"blank\" class=\"hidden\"><td><div><div class=\"empty\">&nbsp;</div></div></td></tr></table>\r\n            <tmpl_var dragger.init>\r\n</tmpl_if>\r\n		','page',1,1);
INSERT INTO template VALUES ('1','Default Page','<a href=\"<tmpl_var assetId>\"></a>\r\n\r\n<tmpl_if displayTitle>\r\n  <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n<p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin>\r\n	<table border=\"0\" id=\"position1\" class=\"content\"><tbody>\r\n</tmpl_if>\r\n\r\n<tmpl_loop position1_loop>\r\n	<tmpl_if showAdmin>\r\n            	<tr id=\"td<tmpl_var id>\">\r\n            		<td><div id=\"td<tmpl_var id>_div\" class=\"dragable\">      \r\n	</tmpl_if>\r\n\r\n	<div class=\"content\"><tmpl_var dragger.icon><tmpl_var content></div>\r\n\r\n	<tmpl_if showAdmin>\r\n         			</div></td>\r\n            	</tr>\r\n	</tmpl_if>\r\n</tmpl_loop>\r\n\r\n<tmpl_if showAdmin> \r\n            </tbody></table>\r\n</tmpl_if>\r\n\r\n<tmpl_if showAdmin> \r\n	<table><tr id=\"blank\" class=\"hidden\"><td><div><div class=\"empty\">&nbsp;</div></div></td></tr></table>\r\n            <tmpl_var dragger.init>\r\n</tmpl_if>\r\n		','page',1,1);

INSERT INTO template VALUES ('1','File','<tmpl_if session.var.adminOn><tmpl_if controls><p><tmpl_var controls></p></tmpl_if></tmpl_if><a href=\"<tmpl_var fileUrl>\"><img src=\"<tmpl_var fileIcon>\" alt=\"<tmpl_var title>\" border=\"0\" /><tmpl_var filename></a>','FileAsset',1,1);
INSERT INTO template VALUES ('2','Image','<tmpl_if session.var.adminOn><tmpl_if controls><p><tmpl_var controls></p></tmpl_if></tmpl_if><img src=\"<tmpl_var fileUrl>\" <tmpl_var parameters> />','ImageAsset',1,1);

INSERT INTO template VALUES ('15','File Folder','<a name=\"<tmpl_var assetId>\"></a><tmpl_if session.var.adminOn>\r\n <p><tmpl_var controls></p>\r\n</tmpl_if>\r\n\r\n<tmpl_if displayTitle>\r\n      <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n     <p><tmpl_var description></p>\r\n</tmpl_if>\r\n\r\n<table width=\"100%\" cellpadding=\"3\" cellspacing=\"0\" class=\"content\">\r\n<tmpl_loop subfolder_loop>\r\n<tr>\r\n    <td class=\"tableData\" valign=\"top\"><a href=\"<tmpl_var url>\"><img src=\"<tmpl_var icon.small>\" border=\"0\" alt=\"<tmpl_var title>\"></a> <a href=\"<tmpl_var url>\"><tmpl_var title></td>\r\n<td valign=\"top\" colspan=\"3\"><tmpl_var synopsis></td></tr>\r\n</tmpl_loop>\r\n<tmpl_loop file_loop>\r\n<tr>\r\n <td valign=\"top\" class=\"tableData\"><a href=\"<tmpl_var url>\"><img src=\"<tmpl_var icon.small>\" border=\"0\" alt=\"<tmpl_var title>\"></a> <a href=\"<tmpl_var url>\"><tmpl_var title></td>\r\n   <td class=\"tableData\" valign=\"top\"><tmpl_var synopsis></td>\r\n     <td class=\"tableData\" valign=\"top\">^D(\"%z %Z\",<tmpl_var date.epoch>);</td>\r\n   <td class=\"tableData\" valign=\"top\"><tmpl_var size></td>\r\n</tr>\r\n</tmpl_loop>\r\n\r\n</table>', 'Folder',1,1);

alter table HttpProxy add column cookieJarStorageId varchar(22);

alter table Survey drop column reportcardTemplateId;
alter table Survey add column gradebookTemplateId varchar(22) default 'PBtmpl0000000000000062';

-- Len Kranendonk 20050112 --
-- Converting the Indexed Search system to Assets. --
truncate table IndexedSearch_docInfo;
alter table IndexedSearch_docInfo drop pageId;
alter table IndexedSearch_docInfo drop languageId;
alter table IndexedSearch_docInfo change wobjectId assetId varchar(22);
alter table IndexedSearch_docInfo drop page_groupIdView;
alter table IndexedSearch_docInfo change wobject_special_groupIdView special_groupIdView varchar(22);
alter table IndexedSearch_docInfo change wobject_groupIdView groupIdView varchar(22);
update USS set sortBy='lineage' where sortBy='sequenceNumber';
delete from settings where name='trackPageStatistics';
drop table pageStatistics;
delete from settings where name='snippetPreviewLength';
delete from incrementer where incrementerId in ('collateralFolderId','themeId','themeComponentId');

create table Collaboration (
  assetId varchar(22) not null primary key,
  postGroupId varchar(22) not null default '2',
  moderateGroupId varchar(22) not null default '4',
  moderatePosts int not null default 0,
  karmaPerPost int not null default 0,
  collaborationTemplateId varchar(22) not null,
  threadTemplateId varchar(22) not null,
  postFormTemplateId varchar(22) not null,
  searchTemplateId varchar(22) not null,
  notificationTemplateId varchar(22) not null,
  sortBy varchar(35) not null default 'dateUpdated',
  sortOrder varchar(4) not null default 'desc',
  usePreview int not null default 1,
  addEditStampToPosts int not null default 0,
  editTimeout int not null default 3600,
  attachmentsPerPost int not null default 0,
  allowRichEdit int not null default 1,
  filterCode varchar(30) not null default 'javascript',
  useContentFilter int not null default 1,
  threads int not null default 0,
  views int not null default 0,
  replies int not null default 0,
  rating int not null default 0,
  lastPostId varchar(22),
  lastPostDate bigint,
  archiveAfter int not null default 31536000,
  postsPerPage int not null default 10,
  threadsPerPage int not null default 30,
  subscriptionGroupId varchar(22),
  allowReplies int not null default 0
);

create table Thread (
  assetId varchar(22) not null primary key,
  replies int not null default 0,
  lastPostId varchar(22) not null default 0,
  lastPostDate bigint,
  isLocked int not null default 0,
  isSticky int not null default 0,
  subscriptionGroupId varchar(22)
);

create table Post (
  assetId varchar(22) not null primary key,
  threadId varchar(22) not null,
  dateSubmitted bigint,
  dateUpdated bigint,
  username varchar(30),
  content mediumtext,
  status varchar(30) not null default 'approved',
  views int not null default 0,
  contentType varchar(35) not null default 'mixed',
  userDefined1 text,
  userDefined2 text,
  userDefined3 text,
  userDefined4 text,
  userDefined5 text,
  storageId varchar(22),
  rating int not null default 0
);

create table Post_rating (
  assetId varchar(22) not null,
  userId varchar(22) not null,
  ipAddress varchar(15) not null,
  dateOfRating bigint,
  rating int not null default 0
);

create table Post_read (
 postId varchar(22) not null,
 threadId varchar(22) not null,
 userId varchar(22) not null,
 readDate bigint
);

delete from template where namespace='Forum/PostPreview';
insert into settings values ("richEditCss","^/;site.css");
delete from settings where name in ('sharedTrash','sharedClipboard');

alter table IndexedSearch add linkURL text;

update template set template='<a name=\"<tmpl_var assetId>\"></a>\r\n<tmpl_if session.var.adminOn>\r\n	<p><tmpl_var controls></p>\r\n</tmpl_if>	\r\n		<tmpl_if displayTitle>\r\n    <h1><tmpl_var title></h1>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n    <tmpl_var description><p />\r\n</tmpl_if>\r\n\r\n<table class=\"tableMenu\" width=\"100%\">\r\n  <tbody>\r\n    <tr>\r\n      <td align=\"center\" width=\"15%\">\r\n      <h1><tmpl_var int.search></h1>\r\n      </td>\r\n      <td vAlign=\"top\" align=\"middle\">\r\n      <table>\r\n      <form method=\"post\" action=\"<tmpl_var actionURL>\">\r\n      <tbody>\r\n      <tr>\r\n	<td colspan=\"2\" class=\"tableData\">\r\n	   <input maxLength=\"255\" size=\"30\" value=\'<tmpl_var query>\' name=\"query\">\r\n	</td>\r\n	<td class=\"tableData\"><tmpl_var submit></td>\r\n      </tr>\r\n      <tr>\r\n	<td class=\"tableData\" valign=\"top\">\r\n\r\n	</td>\r\n	<td class=\"tableData\" valign=\"top\">\r\n	   <tmpl_loop contentTypesSimple>\r\n	     <tmpl_unless __FIRST__>\r\n	     	<input type=\"checkbox\" name=\"contentTypes\" value=\"<tmpl_var value>\"\r\n		<tmpl_if type_content>\r\n		   <tmpl_if query>\r\n			<tmpl_if selected>\r\n			   checked=\"1\"\r\n			</tmpl_if>\r\n		   <tmpl_else>\r\n			checked=\"1\"\r\n		   </tmpl_if>\r\n		<tmpl_else>\r\n		   <tmpl_if selected>checked=\"1\"</tmpl_if>\r\n		</tmpl_if>\r\n		><tmpl_var name>\r\n                <br>\r\n	     </tmpl_unless>\r\n	   </tmpl_loop>\r\n	</td>\r\n        <td></td>\r\n      </tbody>\r\n      </form>\r\n      </table>\r\n      </td>      \r\n    </tr>\r\n  </tbody>\r\n</table>\r\n\r\n<p/>\r\n<tmpl_if numberOfResults>\r\n   <p>Results <tmpl_var startNr> - <tmpl_var endNr> of about <tmpl_var numberOfResults> \r\n   containing <b>\"<tmpl_var queryHighlighted>\"</b>. Search took <b><tmpl_var duration></b> seconds.</p>\r\n   <ol style=\"Margin-Top: 0px; Margin-Bottom: 0px;\" start=\"<tmpl_var startNr>\">\r\n   <tmpl_loop resultsLoop>\r\n      <li>\r\n	   <a href=\"<tmpl_var location>\">\r\n	      <tmpl_if header><tmpl_var header><tmpl_else>No Title</tmpl_if></a>\r\n	   <div>\r\n	      <tmpl_if \"body\">\r\n		   <span class=\"preview\"><tmpl_var \"body\"></span><br/>\r\n	      </tmpl_if>\r\n	      <span style=\"color:#666666;\">Location: <tmpl_var crumbTrail></span>\r\n	      <br/>\r\n	      <br/>\r\n	   </div>\r\n      </li>\r\n   </tmpl_loop>\r\n   </ol>\r\n</tmpl_if> \r\n\r\n\r\n<tmpl_if pagination.pageCount.isMultiple>\r\n  <div class=\"pagination\">\r\n    <tmpl_var pagination.previousPage>  &middot; <tmpl_var pagination.pageList.upTo20> &middot; <tmpl_var pagination.nextPage>\r\n  </div>\r\n</tmpl_if>\r\n' where namespace='IndexedSearch' and templateId='1';

delete from template where templateId='2' and namespace='IndexedSearch';
delete from template where templateId='3' and namespace='IndexedSearch';

