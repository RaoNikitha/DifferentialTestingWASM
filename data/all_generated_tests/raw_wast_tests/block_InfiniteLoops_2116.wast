;; 7. **Test 7: Conditional Nested Loop Branching**    - A nested loop within a `block` that branches (`br` and `br_if`) based on operand conditions, designed to test complex label indexing and stack behavior.    - Evaluates if label indexing and branch instructions maintain stack integrity to avoid infinite loops.

(assert_invalid
  (module
    (func $conditional-nested-loop-branch (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (br_if 1)  ;; Exit block if non-zero
          (i32.const 2)
          (loop (result i32)
            (i32.const 3)
            (br_if 1)  ;; Exit outer loop if non-zero
            (i32.const 4)
            (br_if 0)  ;; Continue with the inner loop
          )
          (drop)
        )
      )
    )
  )
  "type mismatch"
)