/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
This validator validates if a value is is less than a maximum number
*/
component accessors="true" implements="cbvalidation.models.validators.IValidator" singleton{

	property name="name";

	MaxValidator function init(){
		name = "Max";
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

		// Simple Tests
		if( !isNull(arguments.targetValue) AND arguments.targetValue <= arguments.validationData ){
			return true;
		}
		var args = {
			message        = "The '#arguments.field#' value is not less than or equal to #arguments.validationData#",
			field          = arguments.field,
			validationType = getName(),
			rejectedValue  = ( isSimpleValue( arguments.targetValue ) ? arguments.targetValue : '' ),
			validationData = arguments.validationData
		};
		var error = validationResult.newError(argumentCollection=args).setErrorMetadata({max=arguments.validationData});
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
