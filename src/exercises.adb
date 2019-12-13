package body exercises with SPARK_Mode is

   procedure Calc(Cost: in Integer; Result: out Integer) is
      Charge: Integer := -1;
   begin
      if Cost < 100 then
         Charge := Cost * 100;
      end if;
      Result := Charge;
   end Calc;

   procedure CalculateCharge(Quantity: in Integer; Charge: out Integer) is
      CostPence: constant Integer := 5000;
   begin
      Charge := CostPence * Quantity;
   end CalculateCharge;

   procedure Modify(A: in out SmallArray; B, C: in Integer) is
   begin
      A(B+C) := 40;
   end Modify;

   -- Updates the Target sequence using values in Mask. Each element of Mask
   -- is either 0 or 1, so that Target has elements set to 0 where corresponding
   -- Mask element is 0, and keeps its original value otherwise.
   procedure MaskSequence (Target: in out SmallArray; Mask: in SmallArray) is
   begin
      for I in Size loop
         Target(I) := Target(I) * Mask(I);
         pragma Loop_Invariant(for all J in Size'First .. I =>
                              (Target(J) = Target'Loop_Entry(J) or Target(J) = 0));
      end loop;
   end MaskSequence;

end exercises;
