package exercises with SPARK_Mode is

   subtype Size is Integer range 0..20;
   type SmallArray is array (Size) of Integer;

   procedure Calc(Cost: in Integer; Result: out Integer)
     with
       Global => null,
       Depends => (Result => Cost),
       Pre => (Cost < Integer'Last / 100 and then Cost > Integer'First / 100),
     Post => (Result = -1 or Result = Cost * 100);

   procedure CalculateCharge(Quantity: in Integer; Charge: out Integer)
     with
       Global => null,
       Depends => (Charge => Quantity),
       Pre => (Quantity < Integer'Last / 5000 and Quantity > Integer'First/5000),
       Post => (Charge = Quantity * 5000);


   procedure Modify(A: in out SmallArray; B, C: in Integer)
     with
       Global => null,
       Depends => (A => (A,B,C)),
       Pre => ((C > 0  and then B < Integer'Last - C  and then B + C in Size'Range)
               or (B > 0 and then C < Integer'Last - B and then B + C in Size'Range)),
     Post => ( A(B+C) = 40 );

   procedure MaskSequence (Target: in out SmallArray; Mask: in SmallArray)
     with
       Global => null,
       Depends => (Target => (Target,Mask)),
       Pre => (for all I in Size'Range => (Mask(I) = 1 or Mask(I) = 0)),
       Post => (for all I in Size'Range => (Target(I) = Target'Old(I) or Target(I) = 0));

end exercises;
