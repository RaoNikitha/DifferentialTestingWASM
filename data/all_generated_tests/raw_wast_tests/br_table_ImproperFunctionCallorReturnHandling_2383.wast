;; 3. Construct a `br_table` with an operand out of bounds triggering the default label that contains a `call_indirect` instruction. Check if the function table lookup corresponds correctly to the default behavior and does not invoke an unintended function.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (type $i32_to_i32 (func (param i32) (result i32)))
    (func $test (result i32)
      (block (result i32)
        (br_table 0 1 (i32.const 2))
        (call_indirect (type $i32_to_i32) (i32.const 0) (i32.const 0))
      )
    )
  )
  "undefined element"
)