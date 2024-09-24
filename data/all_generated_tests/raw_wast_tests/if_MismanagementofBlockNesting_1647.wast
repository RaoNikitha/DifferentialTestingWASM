;; 8. **Test 8**:    - An `if` block within an `if` block, where the inner block includes a nested loop with backward and forward branches.    - Verifies correct label and context management as control switches between nested conditional and loop blocks.

(assert_invalid
  (module
    (func
      (if (result i32)
        (i32.const 1)
        (then
          (if
            (i32.const 1)
            (then
              (loop $loop
                (br_if 1 (i32.const 1))  ;; forward branch
                (br 0)  ;; backward branch
              )
            )
          )
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)