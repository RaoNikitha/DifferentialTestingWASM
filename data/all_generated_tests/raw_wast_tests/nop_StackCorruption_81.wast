;; 2. A sequence of simple arithmetic operations (addition and subtraction) interspersed with `nop` instructions to verify that intermediate stack values remain consistent and are not corrupted by the `nop` instruction.

(assert_invalid
  (module 
    (func $test (result i32)
      i32.const 5
      nop
      i32.const 3
      i32.add
      nop
      i32.const 2
      i32.sub
      nop
    ) 
  )
  "type mismatch"
)