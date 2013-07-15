### Compile info ###

Project is coded in Haxe (Haxe/AS3/JS/jQuery) and targets HTML5 via OpenFL. I also made some tweaks to the standard OpenFL workflow in order to build UI in raw HTML/CSS.

Install **[Haxe](http://haxe.org/download)**<br />
Instal **[OpenFL](https://github.com/openfl/openfl/wiki/Get-Started)**


Clone repo and run: 

    openfl test html5
    

Run **dice.html**

OpenFL will generate an index.html file each build.  You can ignore that - instead use the dice.html template which is already setup (without an existing template, you would have to write/generate the UI in Haxe). 

(tested on Windows)
<br /><br />

**Helpful links**: <br />
http://haxe.org<br />
http://api.haxe.org<br />
http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/<br />
https://github.com/openfl/openfl/wiki/Get-Started


<br />



### Premise ###
This is a practice <del>Ruby Haxe</del> Haxe + OpenFL project.  To simulate... DICE. 
What can a die do?  Well. It can roll. 
What properties are of it?  It has 6 sides (typically, though some DnD ones have more). What happens when a die is rolled?  It lands!  One one of the six sides. The die then shows the result.  And the roll is complete.  So we have a begin state. A rolling state.  Rolls typically take a few seconds.  And the final result state.  In which the roll is complete, and the result is displayed for us all to see. 

<br />

### Execution Flow / Design pattern ###

Application's execution goes something like this:  

---> **Ai** ---> **Display** --> **Input** --- (and repeat)

**Ai**() does the heavy lifting and logic. 

**Display**() renders stuff to the screen. 

**Input**() accepts user input, translates it for Ai. 

Organizing & separating code into these three paradigms, then enforcing consistent flow between them - seems to help one keep a good mental model of the app's execution flow. Or maybe it's just CRA-ZAY.