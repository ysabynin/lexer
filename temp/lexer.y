%{
  import java.io.*;
%}
      
%token NUM 
%token OPERATOR 
%token BRACKET
%token SPACE
%token VAR 
%token SKIP 
%token WRITE 
%token READ 
%token WHILE 
%token DO 
%token IF 
%token THEN 
%token ELSE 
%token SEMICOLON 
%token COLONEQUAL 
%token COLON

%token <dval> NUM

%type <dval> exp
//%type <dval> s

%left OPERATOR
%nonassoc    SPACE

%%

input:   /* empty string */
       | input s
       ;
      

s:    	 SKIP                {}
       | VAR COLONEQUAL exp  {}
       | s COLON s   		 {}
       | WRITE exp			 {}
       | READ exp			 {}
       | WHILE exp DO s		 {}
       | IF exp	THEN s ELSE s {}
       ;


exp:     NUM                {}
       | VAR        		{}
       | exp OPERATOR exp   {}
       | BRACKET exp BRACKET {}
       ;



%%

  private Yylex lexer;


  private int yylex () {
    int yyl_return = -1;
    try {
      yylval = new ParserVal(0);
      yyl_return = lexer.yylex();
    }
    catch (IOException e) {
      System.err.println("IO error :"+e);
    }
    return yyl_return;
  }


  public void yyerror (String error) {
    System.err.println ("Error: " + error);
  }


  public Parser(Reader r) {
    lexer = new Yylex(r, this);
  }


  public static void main(String args[]) throws IOException {
    Parser yyparser = null;
    if ( args.length > 0 ) {
      // parse a file
      yyparser = new Parser(new FileReader(args[0]));
      yyparser.yyparse();
    }
  }
