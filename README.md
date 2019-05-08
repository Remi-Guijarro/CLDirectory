# CLDirectory
A command line directory

>Show the available directory :
```Console
foo@bar$ annuaire -f    
```
> Send email :
```Console
foo@bar$ annuaire -E
```

> Sort by service and by name :
```Console
foo@bar$ annuaire -t  annuaireFile
```
> Sort by tel number :
```Console
foo@bar$ annuaire -T  annuaireFile 
```
> Display the registrants name :
```Console
foo@bar$ annuaire -M  annuaireFile 
```
> Display the last registrant :
```Console
foo@bar$ annuaire -d  annuaireFile
```
> Display the registrants name using the syntax Lastename.Name :
```Console
foo@bar$ annuaire -m  annuaireFile
``` 
> Search a registrant by his name :
```Console
foo@bar$ annuaire -g Dupont annuaireFile OR annuaire -g Du annuaireFile 
``` 
> Add a registrant :
```Console
foo@bar$ annuaire -a name annuaireFile
```
> Create a file per service :
```Console
foo@bar$ annuaire -e annuaireFile
```
> Delete a registrand by his exacte name :
```Console
foo@bar$ annuaire -s name annuaireFile 
```
> Display staff which belong to a building :
```Console
foo@bar$ annuaire -b THE_LETTER_OF_THE_BUILDING name annuaireFile 
```
