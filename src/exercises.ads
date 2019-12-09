package exercises with SPARK_Mode is

   subtype Size is Integer range 0..20;
   type SmallArray is array (Size) of Integer;


   procedure Calc(Cost: in Integer; Result: out Integer);

   procedure CalculateCharge(Quantity: in Integer; Charge: out Integer);

   procedure Modify(A: in out SmallArray; B, C: in Integer);

   procedure MaskSequence (Target: in out SmallArray; Mask: in SmallArray);

end exercises;
