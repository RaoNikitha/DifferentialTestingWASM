;; 2. Test the operand stack behavior when using nested `block` instructions with `br_if` conditions that check different depths of the stack, ensuring proper stack unwinding and result types matching for each condition.

(assert_invalid
  (module (func $nested-blocks-br-if-test (result i64)
    (block (result i64)
      (i32.const 1)
      (block (result i64)
        (i32.const 2)
        (br_if 1 (i32.const 0)) 
        (i64.const 3)
      )
      (i64.const 4)
    )
  ))
  "type mismatch"
)