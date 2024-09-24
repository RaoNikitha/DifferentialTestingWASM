;; 5. **Test 5**:    - An `if` block with a nested loop containing an `if-else` structure and backward branches.    - Ensures correctness in control flow management and label handling through complex nesting and branches.

(assert_invalid
  (module (func $nested-loop-if-else (result i32)
    (if (result i32) (i32.const 1)
      (then
        (loop (param i32) (result i32)
          (if (i32.const 0)
            (then (i32.const 2))
            (else (br 1))
          )
          (i32.const 3)
        )
      )
      (else (i32.const 4))
    )
  ))
  "type mismatch"
)