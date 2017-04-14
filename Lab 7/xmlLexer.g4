lexer grammar xmlLexer;

fragment CHAR: [a-zA-Z] ;
fragment DIGIT: [0-9] ;
fragment ALLBUTX: [a-wyzA-WYZ] ;
fragment ALLBUTM: [a-ln-zA-LN-Z] ;
fragment ALLBUTL: [a-km-zA-KM-Z] ;
fragment ALLBUTXML: ( ( ALLBUTX CHAR* ) | ( CHAR ALLBUTM CHAR* ) | ( CHAR CHAR ALLBUTL CHAR* ) ) ;
fragment ELEMENTNAME: ( CHAR | DIGIT | '-' | '_' | '.' )+ ;
fragment ELEMENTTAG: '<' ELEMENTNAME '>' ;
fragment ELEMENTCLOSETAG: '<' '/' ELEMENTNAME '>' ;

fragment SPECIALCHARACTERS: [-_~!$&'()*+,;=:] ;
fragment LOCALPARTNOPERIOD: ( CHAR | DIGIT | SPECIALCHARACTERS )+ ;
fragment LOCALPART: ( LOCALPARTNOPERIOD '.'? LOCALPARTNOPERIOD )+ ;
fragment DOMAINPART: ( ( CHAR | DIGIT | '-' ) '.'? ( CHAR | DIGIT | '-' ) )+ . ( CHAR | DIGIT ) ;

fragment DAY: [0][1-9] | [12][0-9] | [3][01] ;
fragment MONTH: [0][0-9] | [1][012] ;
fragment YEAR: [2][0][0-9][0-9] | [2][1][0][0] ;
fragment DATE: DAY '/' MONTH '/' YEAR ;

fragment PHONE : DIGIT DIGIT DIGIT '-' DIGIT DIGIT DIGIT '-' DIGIT DIGIT DIGIT DIGIT
	| '(' DIGIT DIGIT DIGIT ')' ' ' DIGIT DIGIT DIGIT '-' DIGIT DIGIT DIGIT DIGIT
	| DIGIT DIGIT DIGIT ' ' DIGIT DIGIT DIGIT ' ' DIGIT DIGIT DIGIT DIGIT
	| DIGIT DIGIT DIGIT '.' DIGIT DIGIT DIGIT '.' DIGIT DIGIT DIGIT DIGIT ;

fragment VISA: [4] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT
	| [4] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT ;
fragment MASTERCARD: [5][1-5] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT ;
fragment AMERICAN: [3][47] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT ;
fragment DINERS: [3][0][0-5] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT
	| [3][68] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT
	| [5] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT ;
fragment DISCOVER: [6][0][1][1] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT
	| [6][5] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT ;
fragment JCB: ( [2][1][3][1] | [1][8][0][0] ) DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT
	| [3][5] DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT ;
fragment CREDITCARD: VISA | MASTERCARD | AMERICAN | DINERS | DISCOVER | JCB ;

fragment OTHER: ( CHAR | DIGIT | SPECIALCHARACTERS | ' ' )+ ;

TAG: ( ELEMENTTAG | ELEMENTCLOSETAG )
	{System.out.println("Found tag: " + getText());} ;
EMAIL: LOCALPART '@' DOMAINPART
	{System.out.println("Found email: " + getText());} ;
FOUNDDATE: DATE
        {System.out.println("Found date: " + getText());} ;
FOUNDPHONE: PHONE
	{System.out.println("Found phone: " + getText());} ;
FOUNDCREDIT: CREDITCARD
	{System.out.println("Found credit: " + getText());} ;
FOUNDOTHER: OTHER
	{System.out.println("Found other: " + getText());} ;
