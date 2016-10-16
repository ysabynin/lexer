%%

%byaccj
%line
%column

%{
  private Parser yyparser;

  public Yylex(java.io.Reader r, Parser yyparser) {
    this(r);
    this.yyparser = yyparser;
  }
%}

comment = ("(*"([^"*"]|[\r\n]|("*"+([^"*"\"]|[\r\n])))*"*"+")")|("//"[^.\r\n]*)
num = ("-")?[0-9]+
operator = "+" | "-" | "**"| "*" | "/" | "%" | "==" | "!=" | ">" | ">=" | "<" | "<=" | "&&" | "||"
var = [a-zA-Z]+
bracket = "(" | ")"
%%

{comment} {
	System.out.format("Comment(%s, %d, %d, %d); ", yytext(), yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.COMMENT;
 	}

{num} {
	System.out.format("Num(%s, %d, %d, %d); ", yytext(), yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.NUM;
 	}


 {bracket} {
	System.out.format("Bracket(%s, %d, %d, %d); ", yytext(), yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.BRACKET;
 	}

"(//.*)" {
	System.out.format("Comment(%s, %d, %d, %d); ", yytext(), yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.COMMENT;
 	}

{operator} {
	System.out.format("Operator(%s, %d, %d, %d); ", yytext(), yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.OPERATOR;
 	}

 " " { }

 "skip" {
	System.out.format("Skip(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.SKIP;
 	}

 "write" {
	System.out.format("Write(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.WRITE;
 	}

 "read" {
	System.out.format("Read(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.READ;
 	}

 "while" {
	System.out.format("While(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.WHILE;
 	}

  "do" {
	System.out.format("Do(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.DO;
 	}

   "if" {
	System.out.format("If(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.IF;
 	}

   "then" {
	System.out.format("Then(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.THEN;
 	}

    "else" {
	System.out.format("Else(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.ELSE;
 	}

    ";" {
	System.out.format("Colon(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.COLON;
 	}

 	":=" {
	System.out.format("ColonEqual(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.COLONEQUAL;
 	}

 	":" {
	System.out.format("Semicolon(%d, %d, %d); ", yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.SEMICOLON;
 	}

"\n" | "\r" | "\r\n" {return Parser.NL;}

{var} {
	System.out.format("Var(%s, %d, %d, %d); ", yytext(), yyline, yycolumn, yycolumn + yytext().length());
 	return Parser.VAR;
 	}
 	

[^]    { System.err.println("Error: unexpected character \'"+yytext()+"\'"); System.exit(0); }
