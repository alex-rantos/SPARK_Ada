package exercises with SPARK_Mode is

   subtype Size is Integer range 0..20;
   type SmallArray is array (Size) of Integer;

   Cost: Integer;
   Result: Integer;

   procedure Calc(Cost: in Integer; Result: out Integer)
     with
       Global => (Input => Cost,
                 Output => Result),
       Depends => (Result => Charge)
       Pre => (Cost < Integer'Last),
       Post => (X < Integer'Last, X >= Cost'Old);

   procedure CalculateCharge(Quantity: in Integer; Charge: out Integer)
     with
       Global => (Input => Quantity,
                 Output => Charge),
     Depends => (Charge => Quantity)
       Pre => (Quantity < Integer'Last),
       Post => (Charge < Integer'Last, Charge >= Cost'Old);


   procedure Modify(A: in out SmallArray; B, C: in Integer)
     with
       Global => (In_out => A, Input => (B,C)),
       Depends => (A => (A,B,C)),
       Pre => (B < Size'Max, C < Size'Max, B + C < Size'Max));

   procedure MaskSequence (Target: in out SmallArray; Mask: in SmallArray)
     with
       Global => (in_out => Target,
                  input => Mask),
       Depends => (Target => (T,Mask));

end exercises;
