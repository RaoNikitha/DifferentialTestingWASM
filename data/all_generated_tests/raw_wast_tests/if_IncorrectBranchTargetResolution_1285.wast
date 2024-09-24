;; 6. **Test 6: Incorrect Target Resolution with Deep Nested Blocks**    - Deeply nested `if` structures with branches attempting to break out to multiple levels which are incorrectly resolved, causing unexpected jumps.

(assert_invalid
  (module (func $deep-nested-branch (result i32)
    (block (result i32)
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (then (if (result i32)
                  (i32.const 0)
                  (then (br 2 (i32.const 3)))
                  (else (i32.const 2))
                )
          )
          (else (i32.const 3))
        )
      )
    )
  ))
  "incorrect target resolution with deep nested blocks"
)