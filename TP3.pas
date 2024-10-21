Program TP3;


{declaration de liste}
Type 
    P = ^liste;
    liste = Record
        next,under : P;
        S : string;
    End;
Var 
    P1,P2,P3,P4,P5 : P;
    nom : string;
    E,I : integer;


Procedure Affiche(L: P);
Begin

    While L <> Nil Do
        Begin
            writeln(' ':14,'-',L^.S);
            L := L^.next;
        End;

    writeln;
End;




    {FAC creation}


Procedure FAC(Var L : P);
Var 
    N,I : integer;
    current,tail ,FAC : P;
Begin
    FAc := Nil;

    writeln('enter FAC number');
 N :=5;
    For I :=1 To N Do
        Begin
            new(current);
            current^.S := 'faculte ' + chr(ord('A')+random(26));
            CURRent^.next := Nil;
            If FAC = Nil Then
                Begin
                    Fac := current;
                    TAil := FAC;
                End
            Else
                Begin
                    tail^.next := current;
                    tail := current;
                End;

        End;


    L^.under := FAC;

End;

{DEP creation}

Procedure DEP(Var L : P);
Var 
    N,I : integer;
    current,tail ,DEP : P;
Begin
    DEP := Nil;

    If L = Nil Then
        FAC(L);
    writeln('enter DEP number');
  N:=2;
    For I :=1 To N Do
        Begin
            new(current);
            current^.S := 'departement ' + chr(ord('A')+random(26));
            CURRent^.next := Nil;
            If DEP = Nil Then
                Begin
                    DEP := current;
                    TAil := DEP;
                End
            Else
                Begin
                    TAIL^.next := current;
                    TAIL := current;
                End;

        End;


    L^.under := DEP;

End;



{SPEC creation}






Procedure SPEC(Var L : P);
Var 
    N,I : integer;
    current,tail ,SPEC : P;
Begin
    SPEC := Nil;
    If L = Nil Then
        DEP(L);
    writeln('enter SPEC number');
    N :=4;
    For I :=1 To N Do
        Begin
            new(current);
            current^.S := 'specialite ' + chr(ord('A')+random(26));
            CURRent^.next := Nil;
            If SPEC = Nil Then
                Begin
                    SPEC := current;
                    TAil := SPEC;
                End
            Else
                Begin
                    TAIL^.next := current;
                    TAIL := current;
                End;

        End;


    L^.under := SPEC;

End;


{ETU creation}






Procedure ETU(Var L : P);
Var 
    N,I : integer;
    current,tail ,ETU : P;
Begin
    ETU := Nil;
    If L = Nil Then
        SPEC(L);
    writeln('enter ETU number');
N := 15;
    For I :=1 To N Do
        Begin
            new(current);
            current^.S := 'etudiant ' + chr(ord('A')+random(26));
            CURRent^.next := Nil;
            If ETU = Nil Then
                Begin
                    ETU := current;
                    TAil := ETU;
                End
            Else
                Begin
                    TAIL^.next := current;
                    TAIL := current;
                End;

        End;


    L^.under := ETU;

End;



    {UNI creation}
Procedure UNI(Var L :P);
Var 
    temp : P;
    L1,L2,L3,L4 : P;
Begin
    temp := Nil;
    New(temp);
    readln(nom);
    temp^.S := nom;
    L := temp;
    L^.Next := Nil;
    FAC(L);
    L1 := L^.under;
    While L1 <> Nil Do
        Begin
            DEP(L1);
            L2 := L1^.under;
            While L2<> Nil Do
                Begin
                    SPEC(L2);
                    L3 := L2^.under;
                    While L3<> Nil Do
                        Begin
                            ETU(L3);
                            L4 := L3^.under;
                            L3 := L3^.next;
                        End;
                    L2 := L2^.Next;
                End;
            L1 := L1^.next;
        End;




End;

{FAC recherche}

Function SearchFAC(L: P;ST : String;Var temp :P) : boolean;
Var 
    B : boolean;
    L1 : P;
Begin
    L1 := L^.under;
    B := false;
    While (L1 <> Nil) And (B=FALSE) Do
        Begin
            If  L1^.S = ST Then
                Begin
                    B := True ;
                    temp := L1;
                End;
            L1 := L1^.Next;
        End;
    SEARCHFAC := B;




End;


{DEP recherche}


Function SearchDEP(L : P;ST : String; Var Temp,temp2 :P) : boolean;
Var 
    B : boolean;
    L1,L2 : P;
Begin
    L1 := L^.under;
    B := false;
    While (L1 <> Nil) And (B=false) Do
        Begin
            L2 := L1^.under;
            While L2 <> Nil Do
                Begin
                    If L2^.S = ST Then
                        Begin
                            B := true;
                            TEMP := L1;
                            TEMP2 := L2;
                        End;
                    L2 := L2^.next
                End;
            L1 := L1^.next
        End;
    SearchDEP := B;
End;








{SPEC recherche}



Function SearchSPEC(L : P;ST : String;Var temp,temp2 : P) : boolean;
Var 
    B : boolean;
    L1,L2,L3 : P;
Begin
    L1 := L^.under;
    B := false;
    While (L1 <> Nil) And (B=false) Do
        Begin
            L2 := L1^.under;
            While (L2 <> Nil) And (B=false) Do
                Begin
                    L3 := L2^.under;
                    While L3<> Nil Do
                        Begin
                            If L3^.S = ST Then
                                Begin
                                    B := true;
                                    temp := L2;
                                    temp2 := L3;
                                End;
                            L3 := L3^.next;
                        End;
                    L2 := L2^.next;
                End;
            L1 := L1^.next;
        End;

    SearchSPEC := B;

End;




{ETU recherche}




Function SearchETU(L : P;ST : String;Var temp,temp2: P) : boolean;
Var 
    B : boolean;
    L1,L2,L3,L4 : P;
Begin
    L1 := L^.under;
    B := false;
    While (L1 <> Nil) And (B=false) Do
        Begin
            L2 := L1^.under;
            While (L2 <> Nil) And (B = false) Do
                Begin
                    L3 := L2^.under;
                    While L3<> Nil Do
                        Begin
                            L4 := L3^.under;
                            While (L4 <> Nil) And (B=false) Do
                                Begin
                                    If L4^.S = ST Then
                                        Begin
                                            B := true;
                                            temp := L3;
                                            temp2 := L4;
                                        End;
                                    L4 := L4^.Next;
                                End;
                            L3 := L3^.next;
                        End;
                    L2 := L2^.next;
                End;
            L1 := L1^.next;
        End;

    SearchETU := B;

End;



{AFFICHAGE DE UNI}
Procedure AFFICHAGE(L:P);
Var 
    L1,L2,L3,L4 : P;
Begin
    writeln(L^.S,' :');
    L1 := L^.under;
    While L1 <> Nil Do
        Begin
            writeln(L1^.S,' ');
            L2 := L1^.under;
            While L2 <> Nil Do
                Begin
                    writeln(' ':4,'*',L2^.S,' :');
                    L3 := L2^.under;
                    While L3 <> Nil Do
                        Begin
                            writeln(' ':8,'...',L3^.S,' :');
                            L4 := L3^.under;
                            affiche(L4);
                            L3 := L3^.next;

                        End;
                    L2 := L2^.next;

                End;
            L1 := L1^.next;

        End;
End;


{supprimer Fac}

Procedure SUPFAC(Var L : P);
Var 
    ST : string;
    L1,temp : P;
    B : boolean;
Begin
    L1 := L^.under ;
    Repeat
        writeln('enter which facult‚ you want to delete');
        readln(ST);
        searchFAC(L,ST,temp);
    Until (searchFAC(L,ST,temp)=true) Or (ST='cancel');

    If temp = L1 Then
        Begin
            L1 := L1^.next ;
            L^.under := L1;
            dispose(temp);
        End
    Else
        Begin
            While L1^.next <> temp Do
                Begin

                    L1 := L1^.next;
                End;
            L1^.next := L1^.next^.next;
            dispose(temp);
        End;



End;







{Supprimer DEP}


Procedure SUPDEP(Var L : P);
Var 
    ST : string;
    L1,L2,temp,temp2 : P;
    B : boolean;
Begin
    L1 := L^.under ;
    Repeat
        writeln('enter which departement you want to delete');
        readln(ST);
        searchDEP(L,ST,temp,temp2);
    Until (searchDEP(L,ST,temp,temp2)=true) Or (ST='cancel');
    L1 := temp;
    writeln(L1^.S);
    L2 := L1^.under;
    While (L2^.NEXT <> temp2) Do
        Begin
            L2 := L2^.next;
        End;
    If temp2 = L2 Then
        Begin
            L2 := L2^.next ;
            L1^.under := L2;
            TEMP2 := Nil;
        End
    Else
        Begin
            While L2^.next <> temp2 Do
                Begin
                    L2 := L2^.next;
                End;
            L2^.next := L2^.next^.next;
            temp2 := Nil;
        End;

End;


{Supprimer SPEC}






Procedure SUPSPEC(Var L : P);
Var 
    ST : string;
    L1,L2,temp,temp2 : P;
    B : boolean;
Begin
    L1 := L^.under ;
    Repeat
        writeln('enter which specialit‚ you want to delete');
        readln(ST);
        searchSPEC(L,ST,temp,temp2);
    Until (searchSPEC(L,ST,temp,temp2)=true) Or (ST='cancel');
    L1 := temp;

    L2 := L1^.under;

    While (L2^.NEXT <> temp2) And (L2 <> temp2) Do
        Begin
            L2 := L2^.next;
        End;

    If temp2 = L2 Then
        Begin
            L2 := L2^.next ;
            L1^.under := L2;
            TEMP2 := Nil;
        End
    Else
        Begin
            While L2^.next <> temp2 Do
                Begin
                    L2 := L2^.next;
                End;
            L2^.next := L2^.next^.next;
            temp2 := Nil;
        End;

End;










{Supprimer ETU}








Procedure SUPETU(Var L : P);
Var 
    ST : string;
    L1,L2,temp,temp2 : P;
    B : boolean;
Begin
    L1 := L^.under ;
    Repeat
        writeln('enter which ‚tudiant you want to delete');
        readln(ST);
        searchETU(L,ST,temp,temp2);
    Until (searchETU(L,ST,temp,temp2)=true) Or (ST='cancel');
    L1 := temp;
    L2 := L1^.under;
    While (L2^.NEXT <> temp2) And (L2 <> temp2) Do
        Begin
            L2 := L2^.next;
        End;

    If temp2 = L2 Then
        Begin
            L2 := L2^.next ;
            L1^.under := L2;
            TEMP2 := Nil;
        End
    Else
        Begin
            While L2^.next <> temp2 Do
                Begin
                    L2 := L2^.next;
                End;
            L2^.next := L2^.next^.next;
            temp2 := Nil;
        End;

End;



{trie‚ FAC}

Procedure sortFAC(Var L:P);
Var 
    L1,L2,TEMP,UND : P;
    ST : string;
Begin
    L1 := L^.under;
    While L1 <> Nil Do
        Begin
            L2 := L1^.next;
            While L2 <> Nil Do
                Begin
                    If L1^.S > L2^.S Then
                        Begin
                            ST := L1^.S;
                            L1^.S := L2^.S;
                            L2^.S := ST;
                            temp := L1^.under;
                            L1^.under := L2^.under;
                            L2^.under := temp;
                        End;
                    L2 := L2^.next
                End;
            L1 := L1^.next;
        End;
End;



{trie‚ DEP}

Procedure sortDEP(Var L:P);
Var 
    L1,L2,TEMP,UND,F : P;
    ST : string;
Begin
    F := L^.under;
    While F<> Nil Do
        Begin
            L1 := F^.under;
            While L1 <> Nil Do
                Begin
                    L2 := L1^.next;
                    While L2 <> Nil Do
                        Begin
                            If L1^.S > L2^.S Then
                                Begin
                                    ST := L1^.S;
                                    L1^.S := L2^.S;
                                    L2^.S := ST;
                                    temp := L1^.under;
                                    L1^.under := L2^.under;
                                    L2^.under := temp;
                                End;
                            L2 := L2^.next
                        End;
                    L1 := L1^.next;
                End;
            F := F^.next;
        End;
End;




{trie‚ SPEC}

Procedure sortSPEC(Var L:P);
Var 
    L1,L2,TEMP,UND,F,D : P;
    ST : string;
Begin
    F := L^.under;
    D := F^.under;
    While F<> Nil Do
        Begin
            D := F^.under;
            While D<> Nil Do
                Begin
                    L1 := D^.under;
                    While L1 <> Nil Do
                        Begin
                            L2 := L1^.next;
                            While L2 <> Nil Do
                                Begin
                                    If L1^.S > L2^.S Then
                                        Begin
                                            ST := L1^.S;
                                            L1^.S := L2^.S;
                                            L2^.S := ST;
                                            temp := L1^.under;
                                            L1^.under := L2^.under;
                                            L2^.under := temp;
                                        End;
                                    L2 := L2^.next
                                End;
                            L1 := L1^.next;
                        End;
                    D := D^.next;
                End;
            F := F^.next;
        End;
End;



{trie‚ ETU}

Procedure sortETU(Var L:P);
Var 
    L1,L2,TEMP,UND,F,D,S : P;
    ST : string;
Begin
    F := L^.UNDER;
    While F<> Nil Do
        Begin
            D := F^.under;
            While D <> Nil Do
                Begin
                    S := D^.under;
                    While S <> Nil Do
                        Begin
                            L1 := S^.under;
                            While L1 <> Nil Do
                                Begin
                                    L2 := L1^.next;
                                    While L2 <> Nil Do
                                        Begin
                                            If L1^.S > L2^.S Then
                                                Begin
                                                    ST := L1^.S;
                                                    L1^.S := L2^.S;
                                                    L2^.S := ST;

                                                End;
                                            L2 := L2^.next
                                        End;
                                    L1 := L1^.next;
                                End;
                            S := S^.next;
                        End;
                    D := D^.next;
                End;
            F := F^.next;
        End;

End;



Begin
    randomize;
    writeln(
'creation of university by putting its name and putting its (faculte,departement,specialite,etudiant)s number, names are randomized'
    );
    UNI(P1);
    affichage(P1);
    For I:=1 To 13 Do
        Begin
            writeln('enter your operation');
            writeln('1-search for faculte');
            writeln('2-search for departement');
            writeln('3-search for specialite');
            writeln('4-search for etudiant');
            writeln('5-delete faculte');
            writeln('6-delete departement');
            writeln('7-delete specialite');
            writeln('8-delete etudiant');
            writeln('9-sort faculte');
            writeln('10-sort departement');
            writeln('11-sort specialite');
            writeln('12-sort etudiant');
            writeln('13-sort everything');
            readln(E);
            Case E Of 
                1 : 
                Begin
                    readln(nom);
                    writeln(searchFAC(P1,nom,P2));
                End ;
                2 : 
                Begin
                    readln(nom);
                    writeln(searchDEP(P1,nom,P2,P3));
                End;
                3 : 
                Begin
                    readln(nom);
                    writeln(searchSPEC(P1,nom,P2,P3));
                End;
                4 : 
                Begin
                    readln(nom);
                    writeln(searchETU(P1,nom,P2,P3));
                End;
                5 : 
                Begin

                    supFAC(P1);
                    affichage(P1);
                End;
                6 : 
                Begin

                    supDEP(P1);
                    affichage(P1);
                End;
                7 : 
                Begin

                    supSPEC(P1);
                    affichage(P1);
                End;
                8 : 
                Begin

                    supETU(P1);
                    affichage(P1);
                End;
                9 : 
                Begin
                    sortFAC(P1);
                    affichage(P1);
                End;
                10 : 
                Begin
                    sortDEP(P1);
                    affichage(P1);
                End;
                11 : 
                Begin
                    sortSPEC(P1);
                    affichage(P1);
                End;
                12 : 
                Begin
                    sortETU(P1);
                    affichage(P1);
                End;
                13 : 
                Begin
                    sortFAC(P1);
                    sortDEP(P1);
                    sortSPEC(P1);
                    sortETU(P1);
                    affichage(P1);
                End;
            End;
        End;
End.
