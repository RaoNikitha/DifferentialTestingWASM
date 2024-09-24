;; - Test 4: Create interleaved function calls with `br_table` specifying various branch targets based on a dynamic index. Evaluate whether the correct branch target is resolved and the flow jumps accordingly.

(assert_invalid
  (module
    (func $f1 (result i32) (i32.const 5))
    (func $f2 (result i32) 
      (block
        (br_table 0 1 (i32.const 0))
      )
    )
    (func $call-with-br_table
      (call 1)
    )
  )
  "type mismatch"
)