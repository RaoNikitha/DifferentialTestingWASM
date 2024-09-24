;; Establish an `if` block where the condition itself is manipulated through operations leading to a non-positive integer, checking how each engine performs stack unwinding and jumps within br_table instructions in the `else` branch.

(assert_invalid
  (module (func $test_if_br_table_stack_manip (result i32)
    (if (result i32)
      (i32.add (i32.const -1) (i32.const 2)) 
      (then (i32.const 42))
      (else (br_table 0 (i32.const 0)))
    )
  ))
  "type mismatch"
)