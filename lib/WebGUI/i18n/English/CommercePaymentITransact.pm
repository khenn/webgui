package WebGUI::i18n::English::CommercePaymentITransact;

our $I18N = {
	'firstName' => {
		message => q|First name|,
		lastUpdated => 0,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'lastName' => {
		message => q|Last name|,
		lastUpdated => 0,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'address' => {
		message => q|Address|,
		lastUpdated => 1101772170,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'city' => {
		message => q|City|,
		lastUpdated => 1101772171,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'state' => {
		message => q|State|,
		lastUpdated => 1101772173,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'zipcode' => {
		message => q|Zipcode|,
		lastUpdated => 1101772174,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'email' => {
		message => q|Email|,
		lastUpdated => 1101772176,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'cardNumber' => {
		message => q|Credit card number|,
		lastUpdated => 1101772177,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'expiration date' => {
		message => q|Expiration date|,
		lastUpdated => 1101772180,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	'cvv2' => {
		message => q|Verification number (ie. CVV2)|,
		lastUpdated => 1101772182,
		context => q|Form label in the checkout form of the iTransact module.|
	},
	
	'vendorId' => {
		message => q|Username (Vendor ID)|,
		lastUpdated => 0,
		context => q|Form label in the configuration form of the iTransact module.|
	},
	'use cvv2' => {
		message => q|Use CVV2|,
		lastUpdated => 0,
		context => q|Form label in the configuration form of the iTransact module.|
	},
	'emailMessage' => {
		message => q|Email message|,
		lastUpdated => 0,
		context => q|Form label in the configuration form of the iTransact module.|
	},
	'password' => {
		message => q|Password|,
		lastUpdated => 0,
		context => q|Form label in the configuration form of the iTransact module.|
	},

	'module name' => {
		message => q|CDG Commerce|,
		lastUpdated => 0,
		context => q|The displayed name of the Payflo Pro payment module.|
	},

	'invalid firstName' => {
		message => q|You have to enter a valid first name.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid first name has been entered.|
	},
	'invalid lastName' => {
		message => q|You have to enter a valid last name.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid last name has been entered.|
	},
	'invalid address' => {
		message => q|You have to enter a valid address.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid street has been entered.|
	},
	'invalid city' => {
		message => q|You have to enter a valid city.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid city has been entered.|
	},
	'invalid zip' => {
		message => q|You have to enter a valid zipcode.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid zipcode has been entered.|
	},
	'invalid email' => {
		message => q|You have to enter a valid email address.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid email address has been entered.|
	},
	'invalid card number' => {
		message => q|You have to enter a valid credit card number.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid credit card number has been entered.|
	},
	'invalid cvv2' => {
		message => q|You have to enter a valid card security code (ie. cvv2).|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid card security code has been entered.|
	},
	'invalid expiration date' => {
		message => q|You have to enter a valid expiration date.|,
		lastUpdated => 0,
		context => q|An error indicating that an invalid expiration date has been entered.|
	},
	'no description' => {
		message => q|No description|,
		lastUpdated => 0,
		context => q|The default description of purchase of users.|
	},
	'show terminal' => {
		message => q|Click here to use your virtual terminal.|,
		lastUpdated => 0,
		context => q|The label of the link that points to the virtual terminal login.|
	},
	'set up account' => {
		message => q|Register for a merchant account now to get started processing online transactions.|,
		lastUpdated => 0,
		context => q|The label of the link that points to the account creation page of CDG.|
	},
	'extra info' => {
		message => q|This plugin expects that you set up the following recipe's in your CDG account. Be very careful to enter the recipe names exactly as given below.<br>
<table border="0" cellpadding="3" cellspacing="0">
  <tr>
    <td align="right"><b>weekly</b></td>
    <td> -> </td>
    <td align="left">7 days</td>
  </tr>
  <tr>
    <td align="right"><b>biweekly</b></td>
    <td> -> </td>
    <td align="left">14 days</td>
  </tr>
   <tr>
    <td align="right"><b>fourweekly</b></td>
    <td> -> </td>
    <td align="left">28 days</td>
  </tr>
  <tr>
    <td align="right"><b>monthly</b></td>
    <td> -> </td>
    <td align="left">30 days</td>
  </tr>
  <tr>
    <td align="right"><b>quarterly</b></td>
    <td> -> </td>
    <td align="left">91 days</td>
  </tr>
  <tr>
    <td align="right"><b>halfyearly</b></td>
    <td> -> </td>
    <td align="left">182 days</td>
  </tr>
  <tr>
    <td align="right"><b>yearly</b></td>
    <td> -> </td>
    <td align="left">365 days</td>
  </tr>
</table><br>
Please note that some of these recipe's are only roughly correct. They don't 'fit' exactly in a whole year. Below the affected recipe's are given together with their difference on a year's basis. <br>
<ul>
  <li><b>monthly</b> (differs 5 days each year, 6 days each leap year)</li>
  <li><b>quarterly</b> (differs 1 day each year, 2 days each leap year)</li>
  <li><b>halfyearly</b> (differs 1 day each year, 2 days each leap year)</li>
  <li><b>yearly</b> (differs 1 day each leap year)</li>
</ul><br>
Also set the 'RECURRING POST-BACK URL' field in the Account Settings part of the virtual terminal to:|,
		lastUpdated => 0,
		context => q|An informational message that's shown in the configuration form of this plugin.|
	},
};

1;

