


### Premise ###
This is a practice <del>Ruby Haxe Haxe + OpenFL </del>JavaScript / CSS3 project.  To simulate... DICE. 
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

<br />

### Links & reference ###

For the homescreen UI animations:<br />
[http://daneden.me/animate/ ](http://daneden.me/animate/)

And for an excellent primer on 3D CSS: <br />
[http://desandro.github.io/3dtransforms/](http://desandro.github.io/3dtransforms/)