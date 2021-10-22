/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

(* top =  1  *)
(* src = "relojes_est.v:2" *)
module relojes_est(clk4f_out_e, clk2f_out_e, clk_out_e, clk32f, rst);
  (* src = "relojes_est.v:12" *)
  wire _00_;
  (* src = "relojes_est.v:12" *)
  wire _01_;
  (* src = "relojes_est.v:12" *)
  wire _02_;
  (* src = "relojes_est.v:12" *)
  wire [5:0] _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  wire _32_;
  wire _33_;
  wire _34_;
  wire _35_;
  (* src = "relojes_est.v:4" *)
  output clk2f_out_e;
  (* src = "relojes_est.v:6" *)
  input clk32f;
  (* src = "relojes_est.v:4" *)
  output clk4f_out_e;
  (* src = "relojes_est.v:4" *)
  output clk_out_e;
  (* init = 6'b000000 *)
  (* src = "relojes_est.v:11" *)
  wire [5:0] cont;
  (* src = "relojes_est.v:7" *)
  input rst;
  NOT _36_ (
    .A(cont[0]),
    .Y(_03_[0])
  );
  NOT _37_ (
    .A(cont[1]),
    .Y(_04_)
  );
  NOR _38_ (
    .A(_04_),
    .B(_03_[0]),
    .Y(_05_)
  );
  NOR _39_ (
    .A(cont[1]),
    .B(cont[0]),
    .Y(_06_)
  );
  NOR _40_ (
    .A(_06_),
    .B(_05_),
    .Y(_03_[1])
  );
  NOT _41_ (
    .A(cont[2]),
    .Y(_07_)
  );
  NAND _42_ (
    .A(cont[1]),
    .B(cont[0]),
    .Y(_08_)
  );
  NOR _43_ (
    .A(_08_),
    .B(_07_),
    .Y(_09_)
  );
  NOR _44_ (
    .A(_05_),
    .B(cont[2]),
    .Y(_10_)
  );
  NOR _45_ (
    .A(_10_),
    .B(_09_),
    .Y(_03_[2])
  );
  NOT _46_ (
    .A(cont[3]),
    .Y(_11_)
  );
  NAND _47_ (
    .A(_05_),
    .B(cont[2]),
    .Y(_12_)
  );
  NOR _48_ (
    .A(_12_),
    .B(_11_),
    .Y(_13_)
  );
  NOR _49_ (
    .A(_09_),
    .B(cont[3]),
    .Y(_14_)
  );
  NOR _50_ (
    .A(_14_),
    .B(_13_),
    .Y(_03_[3])
  );
  NAND _51_ (
    .A(_13_),
    .B(cont[4]),
    .Y(_15_)
  );
  NOT _52_ (
    .A(_15_),
    .Y(_16_)
  );
  NOR _53_ (
    .A(_13_),
    .B(cont[4]),
    .Y(_17_)
  );
  NOR _54_ (
    .A(_17_),
    .B(_16_),
    .Y(_03_[4])
  );
  NAND _55_ (
    .A(_15_),
    .B(cont[5]),
    .Y(_18_)
  );
  NOR _56_ (
    .A(_15_),
    .B(cont[5]),
    .Y(_19_)
  );
  NAND _57_ (
    .A(_19_),
    .B(rst),
    .Y(_20_)
  );
  NAND _58_ (
    .A(_20_),
    .B(_18_),
    .Y(_03_[5])
  );
  NOT _59_ (
    .A(clk_out_e),
    .Y(_21_)
  );
  NAND _60_ (
    .A(_09_),
    .B(cont[3]),
    .Y(_22_)
  );
  NOR _61_ (
    .A(_22_),
    .B(cont[5]),
    .Y(_23_)
  );
  NAND _62_ (
    .A(_23_),
    .B(cont[4]),
    .Y(_24_)
  );
  NOR _63_ (
    .A(_24_),
    .B(_21_),
    .Y(_25_)
  );
  NOT _64_ (
    .A(rst),
    .Y(_26_)
  );
  NAND _65_ (
    .A(_24_),
    .B(_21_),
    .Y(_27_)
  );
  NAND _66_ (
    .A(_27_),
    .B(_26_),
    .Y(_28_)
  );
  NOR _67_ (
    .A(_28_),
    .B(_25_),
    .Y(_02_)
  );
  NOR _68_ (
    .A(_23_),
    .B(clk2f_out_e),
    .Y(_29_)
  );
  NAND _69_ (
    .A(_23_),
    .B(clk2f_out_e),
    .Y(_30_)
  );
  NAND _70_ (
    .A(_30_),
    .B(_26_),
    .Y(_31_)
  );
  NOR _71_ (
    .A(_31_),
    .B(_29_),
    .Y(_00_)
  );
  NOR _72_ (
    .A(_08_),
    .B(cont[5]),
    .Y(_32_)
  );
  NOR _73_ (
    .A(_32_),
    .B(clk4f_out_e),
    .Y(_33_)
  );
  NAND _74_ (
    .A(_32_),
    .B(clk4f_out_e),
    .Y(_34_)
  );
  NAND _75_ (
    .A(_34_),
    .B(_26_),
    .Y(_35_)
  );
  NOR _76_ (
    .A(_35_),
    .B(_33_),
    .Y(_01_)
  );
  DFF _77_ (
    .C(clk32f),
    .D(_01_),
    .Q(clk4f_out_e)
  );
  DFF _78_ (
    .C(clk32f),
    .D(_00_),
    .Q(clk2f_out_e)
  );
  DFF _79_ (
    .C(clk32f),
    .D(_02_),
    .Q(clk_out_e)
  );
  DFF _80_ (
    .C(clk32f),
    .D(_03_[0]),
    .Q(cont[0])
  );
  DFF _81_ (
    .C(clk32f),
    .D(_03_[1]),
    .Q(cont[1])
  );
  DFF _82_ (
    .C(clk32f),
    .D(_03_[2]),
    .Q(cont[2])
  );
  DFF _83_ (
    .C(clk32f),
    .D(_03_[3]),
    .Q(cont[3])
  );
  DFF _84_ (
    .C(clk32f),
    .D(_03_[4]),
    .Q(cont[4])
  );
  DFF _85_ (
    .C(clk32f),
    .D(_03_[5]),
    .Q(cont[5])
  );
endmodule
