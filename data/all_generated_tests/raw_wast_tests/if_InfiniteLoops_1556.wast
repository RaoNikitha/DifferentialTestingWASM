;; 7. Design a test with mismatched blocktype-related `if` instructions within the loop. It should manage the stack height correctly, but mismanagement results in infinite loop execution:    ```    (loop $outer      (if (result i32) (i32.const 0)        (then (i32.const 1) (br $outer))        (else (br $outer))      )    )    ```    This test diagnoses proper stack management for `if` conditions within loops, specifically focusing on blocktype constraints.

(assert_invalid
  (module
    (func
      (loop $outer
        (if (result i32) (i32.const 0)
          (then (i32.const 1) (br $outer))
          (else (br $outer))
        )
      )
    )
  )
  "type mismatch"
)