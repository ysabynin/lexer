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

not_num = [0-9]+[a-zA-Z]+
num = ("-")?[0-9]+
comment = ("(*"([^"*"]|[\r\n]|("*"+([^"*"\"]|[\r\n])))*"*"+")")|("//"[^.\r\n]*)
var = [A-Za-z_][A-Za-z0-9_]*
operator = "+" | "-" | "**"| "*" | "/" | "%" | "==" | "!=" | ">" | ">=" | "<" | "<=" | "&&" | "||"
bracket = "(" | ")"
%%

{not_num}	{
		System.exit(0);
}

{comment} {
 	return Parser.COMMENT;
 	}

{num} {
 	return Parser.NUM;
 	}


 {bracket} {
 	return Parser.BRACKET;
 	}

"(//.*)" {
 	return Parser.COMMENT;
 	}

{operator} {
 	return Parser.OPERATOR;
 	}

 " " { }

 "skip" {
 	return Parser.SKIP;
 	}

 "write" {
 	return Parser.WRITE;
 	}

 "read" {
 	return Parser.READ;
 	}

 "while" {
 	return Parser.WHILE;
 	}

  "do" {
 	return Parser.DO;
 	}

   "if" {
 	return Parser.IF;
 	}

   "then" {
 	return Parser.THEN;
 	}

    "else" {
 	return Parser.ELSE;
 	}

    ";" {
 	return Parser.COLON;
 	}

 	":=" {
 	return Parser.COLONEQUAL;
 	}

 	":" {
 	return Parser.SEMICOLON;
 	}

"\n" | "\r" | "\r\n" {return Parser.NL;}

{var} {
 	return Parser.VAR;
 	}
 	

[^]    {
		System.exit(0);
 }
