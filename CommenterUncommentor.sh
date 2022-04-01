#!/bin/bash

#Get the text to search for : 
TEXT="Hello from"

FILE_NAME="myfile.txt"

#Search the text in the file provided and get the line number and the sentence where the text has been found.

LINE_NUMBER=$(grep -n "${TEXT}" "${FILE_NAME}" | cut -d : -f 1)
LINE=$(grep "${TEXT}" "${FILE_NAME}")


#Check if the sentence is commented or not.
#By checking if the first character is hash or not.

FIRST_CHARACTER=${LINE:0:1}

#Hash Sign
HASH="#"

if [[ "${FIRST_CHARACTER}" == "${HASH}" ]]
then
	echo -e "INTIIAL : Line is already commented!!!"
	sed -i "${LINE_NUMBER}s/#//" ${FILE_NAME}
	echo -e "FINAL : Line has now been uncommented!!!"
else
	echo -e "INITIAL : Line is uncommented !!!"
	sed -i "${LINE_NUMBER}s/^/#/" ${FILE_NAME}
	echo -e "FINAL : Line has been now commented!!!"
fi

echo ""

if [[ "${?}" -eq 0 ]]
then
	echo -e "Script has been executed succesfully !!!"
	cat "${FILE_NAME}"
	exit 0
else
	echo -e "Sript execution has been stopped due to an error"
	exit 1
fi
