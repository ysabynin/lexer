%{
  import java.io.*;
  import java.nio.file.Files;
  import java.nio.file.Paths;
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
%token NL
%token COMMENT

%type <dval> s

%left OPERATOR
%nonassoc    SPACE

%%

input:   /* empty string */
       | input s
       | input s NL
       ;
      
s:       NUM                {}
       | OPERATOR        		{}
       | BRACKET        		{}
       | SPACE        		{}
       | VAR        		{}
       | SKIP        		{}
       | WRITE        		{}
       | READ        		{}
       | WHILE        		{}
       | DO        		{}
       | IF        		{}
       | THEN        		{}
       | ELSE        		{}
       | SEMICOLON        		{}
       | COLONEQUAL        		{}
       | COLON        		{}
       | NL        		{}
       | COMMENT        {}
       | s              {}
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
    System.out.println ("Such statement is not supported by Parser");
  }


  public Parser(Reader r) {
    lexer = new Yylex(r, this);
  }


  public static void main(String args[]) throws IOException {
    Parser yyparser = null;
    if ( args.length > 0 ) {
      // parse a file
      System.out.println("<---------------START---------------->");
      String content = new String(Files.readAllBytes(Paths.get(args[0])));
      System.out.println("Text in file:\n"+content+"\n");
      yyparser = new Parser(new FileReader(args[0]));
      yyparser.yyparse();
    }
      System.out.println("\n<---------------END---------------->");
  }
