import 'package:flutter/material.dart';

// Every Widget has 2wo stuffs, one class extends from StatefulWidget, one class extends State<aboveclass>

class QuestionText extends StatefulWidget {

  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin { // Add Animation to the Widget with SingleTickerProviderStateMixin

  // SingleTickerProviderStateMixin can only have ONE AnimationController
  // TickerProviderStateMixin can have MULTIPLE AnimationController

  Animation<double> _fontSizeAnimation; // Value 0.1, 0.2, 0.3,.....until 1.0
  AnimationController _fontSizeAnimationController; // Control _fontSizeAnimation

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this); // Vsync handles animation that goes outside of the screen to prevent your animation rendering outside of the screen
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut); // make the _fontSizeAnimation value increases slowly
    _fontSizeAnimation.addListener(() => this.setState(() {})); // Every time font size changes, we need to rerender the animation somewhere, so we need to add a listener to listen when the _fontSizeAnimation value changes
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() { // free resources from AnimationController, VERY IMPORTANT
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) { //Every time the widget update we will compare the new widget with the old widget
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset(); //Restart animation
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 20.0),
          child: new Center(
            child: new Text("Statement " + widget._questionNumber.toString() + ": " + widget._question,
              style: new TextStyle(fontSize: _fontSizeAnimation.value * 15),
            ), // <-- This is how you get the value out from the class above
          )
      ),
    );
  }
}