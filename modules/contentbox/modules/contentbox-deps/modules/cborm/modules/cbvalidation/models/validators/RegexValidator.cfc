/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
This validator validates against a user defined regular expression
*/
component accessors="true" implements="cbvalidation.models.validators.IValidator" singleton{

	property name="name";

	RegexValidator function init(){
		name = "Regex";
		return this;
	}

	/**
	* Will check if an incoming value validates
	* @validationResultThe result object of the validation
	* @targetThe target object to validate on
	* @fieldThe field on the target object to validate on
	* @targetValueThe target value to validate
	* @validationDataThe validation data the validator was created with
	*/
	boolean function validate(required cbvalidation.models.result.IValidationResult validationResult, required any target, required string field, any targetValue, any validationData){


		if( !isNull(arguments.targetValue) AND isValid("regex", arguments.targetValue, arguments.validationData) ){
			return true;
		}

		var args = {
			message        = "The '#arguments.field#' value does not match the regular expression: #arguments.validationData#",
			field          = arguments.field,
			validationType = getName(),
			rejectedValue  = ( isSimpleValue( arguments.targetValue ) ? arguments.targetValue : '' ),
			validationData = arguments.validationData
		};
		var error = validationResult.newError(argumentCollection=args).setErrorMetadata({regex=arguments.validationData});
		validationResult.addError( error );
		return false;
	}

	/**
	* Get the name of the validator
	*/
	string function getName(){
		return name;
	}

}