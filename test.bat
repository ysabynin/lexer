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
java -cp . Parser ./test/text6.txt
java -cp . Parser ./test/text7.txt
java -cp . Parser ./test/text8.txt
java -cp . Parser ./test/text9.txt
java -cp . Parser ./test/vtext10.txt
java -cp . Parser ./test/vtext11.txt
java -cp . Parser ./test/vtext12.txt
java -cp . Parser ./test/vtext13.txt
java -cp . Parser ./test/vtext14.txt
java -cp . Parser ./test/vtext15.txt
pause
