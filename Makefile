P=ocml

${P}:				${P}.tab.o lex.yy.o
						gcc -o $@ $^ -lfl

%.o:				%.c ${P}.tab.h
						gcc -c $^

${P}.tab.h:	${P}.y
						bison -d ${P}.y

lex.yy.c:		${P}.l
						flex ${P}.l

${P}.tab.c:	${P}.y
						bison ${P}.y

clean:
						rm -f *.tab.* *.yy.* ${P}
