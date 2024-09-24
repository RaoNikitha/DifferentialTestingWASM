;; 4. **Branch if Condition**:    Implement a `block` with a conditional `br_if` instruction that targets an outer block based on stack values. This checks for correct stack unwinding and branch target resolution based on conditions.

(assert_invalid
  (module (func $conditional-br-if (result i32)
    (i32.const 1) (block (result i32) 
      (i32.const 0) 
      (block (result i32) 
        (i32.const 2) 
        (br_if 1)) 
      (i32.const 3)) 
    (br 0))
  ))
  "type mismatch"
)