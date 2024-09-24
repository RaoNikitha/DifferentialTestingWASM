;; 2. **Test 2: Type Mismatch in Nested Blocks**    - Create nested `block` instructions where the outer block expects an `i64` result, but an inner block performs a `br` instruction incorrectly using `f64`.    - Ensures that type mismatches are caught when unwinding the operand stack through nested blocks.    - Tests the correct handling of type constraints between nested control instructions.

(assert_invalid
  (module (func $mismatch-type-in-nested-blocks
    (block (result i64) 
      (block 
        (br 0 (f64.const 1.0))
      )
    )
  ))
  "type mismatch"
)