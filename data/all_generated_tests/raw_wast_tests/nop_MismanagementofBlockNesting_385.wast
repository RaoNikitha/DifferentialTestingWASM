;; 6. **Interleave `nop` within a nested `br_table` case:** Structure a function with a deeply nested `br_table` and place `nop` between branching cases. This is to confirm that the presence of `nop` instructions does not affect the selection of the correct block depth, ensuring proper block management in nested scenarios.

(assert_invalid
 (module
  (func $nested_br_table (param i32) (result i32)
   block $outer
    block $inner
     local.get 0
     br_table $inner $outer $outer
     nop
     local.get 0
    end
   end
   i32.const 0
  )
 )
 "type mismatch"
)