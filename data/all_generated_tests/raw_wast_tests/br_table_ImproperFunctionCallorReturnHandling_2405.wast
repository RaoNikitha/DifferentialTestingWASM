;; 5. **Test 5: BrTable Leading to Mixed Call and Return Instructions**    - Create a `br_table` where some labels target `call` instructions and others target `return` instructions with different operand stack configurations, ensuring arity mismatches are caught and handled.

(assert_invalid
  (module
    (func $mixed-call-return
      (block 
        (block $lbl1 (result i32) (i32.const 1) (return))
        (block $lbl2 (result i32) (i32.const 2) (call $dummy))
        (br_table $lbl1 $lbl2 2 (i32.const 0))
      )
    )
    (func $dummy (param i32))
  )
  "type mismatch"
)