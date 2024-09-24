;; 3. **Test 3**:    - A `loop` block containing an `if` block with a nested `block` that includes forward branches to a label.    - Verifies correct unwinding and context propagation for nested loops and blocks within `if` statements.

(assert_invalid
  (module
    (func $test-loop-if-block
      (loop $loop
        (if (i32.const 1)
          (then 
            (block $inner
              (br 1) 
              (i32.const 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)