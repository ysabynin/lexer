jflex-1.6.1.jar lexer.flex
yacc -J lexer.y
javac -sourcepath ./ Parser.java
java -cp . Parser ./test/text.txt
java -cp . Parser ./test/text0.txt
java -cp . Parser ./test/text0_1.txt
java -cp . Parser ./test/text2.txt
java -cp . Parser ./test/text3.txt
java -cp . Parser ./test/text4.txt
java -cp . Parser ./test/text5.txt
pause