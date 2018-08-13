Var F: File;
    B, C: Array[1..4] of Byte;

BEGIN
  Assign(F, ParamStr(1));
  Reset(F, 1);
    BlockRead(F, C, 4);
    C[1]:=C[1] xor 55;
    C[2]:=C[2] xor 112;
    C[3]:=C[3] xor 40;
    C[4]:=C[4] xor 103;
  Seek(F, $11);
   Repeat
    BlockRead(F, B, 4);
    B[1]:=B[1] xor C[1];
    B[2]:=B[2] xor C[2];
    B[3]:=B[3] xor C[3];
    B[4]:=B[4] xor C[4];
    Write(Char(B[1]), Char(B[2]), Char(B[3]), Char(B[4]));
   Until EoF(F);
  Close(F);
END.

{
	0x37702867 / 7p(g
}
