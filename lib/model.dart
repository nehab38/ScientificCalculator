class Model {
  dynamic expression; //2 + (4 * 5) + 34 - 63
  String history;

  Model(this.expression, this.history);
  
  void equalsTo(){
    expression = expression.replaceAll('MOD','%');
    expression = expression.replaceAll('LOG','log10');
    print(expression);
    try{
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      expression = eval.toString();
    }catch(e){
      expression = 'Incorrect Syntax';
      history =''; 
    }
  }
  
  void baseConversion(int base){
    print('demo');
    history = expression;
    expression = int.parse(expression).toRadixString(base);
  }

}
