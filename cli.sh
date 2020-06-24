#!/bin/bash

if test $1 && test $1 == "sniff"; then
	COMMAND="mcs/vendor/bin/phpcs -s --colors";
    EXTENSIONS="--extensions=css,js,json,php,phtml";

	PEAR_EXCLUDE="--exclude=Generic.PHP.DisallowShortOpenTag,Generic.Files.LineLength";
	#PEAR_EXCLUDE+=",PEAR.Commenting.ClassComment";
	#PEAR_EXCLUDE+=",PEAR.Commenting.FunctionComment";
	PEAR_EXCLUDE+=",PEAR.NamingConventions.ValidFunctionName";
	#PEAR_EXCLUDE+=",PEAR.NamingConventions.ValidVariableName";

	printf "\nTesting with PEAR standard:\n";
    $COMMAND $2 $EXTENSIONS --standard=PEAR $PEAR_EXCLUDE;
    printf "\nDONE!\n";

    PSR2_EXCLUDE="--exclude=Generic.Files.LineLength,PSR1.Classes.ClassDeclaration,Squiz.Classes.ValidClassName"
    
    printf "\nTesting with PSR2 standard:\n";
    $COMMAND $2 $EXTENSIONS --standard=PSR2 $PSR2_EXCLUDE;
    printf "\nDONE!\n";

    MEQP1_EXCLUDE="--exclude=Generic.Files.LineLength";#,Generic.PHP.DisallowShortOpenTag,Generic.PHP.Syntax";
    
    printf "\nTesting with MEQP1 standard:\n";
    $COMMAND $2 $EXTENSIONS --standard=MEQP1 $MEQP1_EXCLUDE;
    printf "\nDONE!\n";

    EXTENSIONS="--extensions=xml";

    PEAR_EXCLUDE="--exclude=Generic.Files.LineLength,Generic.PHP.DisallowShortOpenTag,PEAR.Commenting.FileComment"

    printf "\nTesting XML files with PEAR standard:\n";
    $COMMAND $2 $EXTENSIONS --standard=PEAR $PEAR_EXCLUDE;
    printf "\nDONE!\n";

    PSR2_EXCLUDE="--exclude=Generic.Files.LineLength,Generic.PHP.DisallowShortOpenTag";
    
    printf "\nTesting XML files with PSR2 standard:\n";
    $COMMAND $2 $EXTENSIONS --standard=PSR2 $PSR2_EXCLUDE;
    printf "\nDONE!\n";

    MEQP1_EXCLUDE="--exclude=Generic.Files.LineLength,Generic.PHP.DisallowShortOpenTag,Generic.PHP.Syntax,MEQP1.PHP.Syntax";

    printf "\nTesting XML files with MEQP1 standard:\n";
    $COMMAND $2 $EXTENSIONS --standard=MEQP1 $MEQP1_EXCLUDE;
    printf "\nDONE!\n";
fi;

printf "\n";
