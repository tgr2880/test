/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
The ColdBox validation error interface, all inspired by awesome Hyrule Validation Framework by Dan Vega
*/
import cbvalidation.models.result.*;
interface{

	/**
	* Set the error message
	* @messageThe error message
	*/
	IValidationError function setMessage(required string message);
	 
	/**
	* Set the field
	* @messageThe error message
	*/
	IValidationError function setField(required string field);
	
	/**
	* Set the rejected value
	* @valueThe rejected value
	*/
	IValidationError function setRejectedValue(required any value);
	
	/**
	* Set the validator type name that rejected
	* @validationTypeThe name of the rejected validator
	*/
	IValidationError function setValidationType(required any validationType);
	
	/**
	* Get the error validation type
	*/
	string function getValidationType();
	
	/**
	* Set the validator data
	* @dataThe data of the validator
	*/
	IValidationError function setValidationData(required any data);
	
	/**
	* Get the error validation data
	*/
	string function getValidationData();
	
	/**
	* Get the error message
	*/
	string function getMessage();
	
	/**
	* Get the error field
	*/
	string function getField();
	
	/**
	* Get the rejected value
	*/
	any function getRejectedValue();
	
}