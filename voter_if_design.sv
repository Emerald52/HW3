module voter_if (I, O);
input [3:0] I;
output [3:1] O;
reg [3:1] O;
//每當有I輸入時
always@ (I)
begin
  //結果為"反對"
  if (I==4'b0000) O[3] = 1;
  else if (I==4'b0001) O[3]=1;
  else if (I==4'b0010) O[3]=1;
  else if (I==4'b0100) O[3]=1;
  else if (I==4'b1000) O[3]=1;
  else O[3]=0;                    //若結果不為"反對"，則O3輸出0
  //結果為"平手"
  if (I==4'b0011) O[2]=1;
  else if (I==4'b0101) O[2]=1;
  else if (I==4'b0110) O[2]=1;
  else if (I==4'b1001) O[2]=1;
  else if (I==4'b1010) O[2]=1;
  else if (I==4'b1100) O[2]=1;
  else O[2]=0;                    //若結果不為"平手"，則O2輸出0
  //結果為"贊成"
  if (I==4'b1110 || I==4'b1101 || I==4'b1011 || I==4'b0111 || I==4'b1111)
      O[1]=1;
  else
      O[1] = 0;                  //若結果不為"贊成"，則O1輸出0
end
endmodule
