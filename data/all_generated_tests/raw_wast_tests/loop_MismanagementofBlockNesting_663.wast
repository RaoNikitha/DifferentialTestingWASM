;; - Test 4: Define a loop that contains another loop with nested conditional branches. Use a `br` statement targeting the inner loop from within the inner conditional block. Verify if the branch correctly restarts the inner loop and not mistakenly any outer structure. This test is to ensure the mechanism of backward jumps in deeply nested structures.

(assert_invalid
  (module
    (func $nested_loops_with_br
      (loop $outer (result i32)
        (i32.const 10)
        (loop $inner (result i32)
          (block 
            (br $inner)
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)