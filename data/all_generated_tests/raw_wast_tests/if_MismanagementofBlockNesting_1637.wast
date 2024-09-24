;; 8. Define a loop containing an `if` statement, where the loop exits using a `br_table`. Ensure the intermediary `if` branches correctly align with the outer loop's stack type and control flow.    - **Constraint**: Verify correct stack management and type matching.    - **Behavior**: Incorrect handling could cause stack misalignment or improper flow.

(assert_invalid
 (module
  (func $loop-if-br_table
    (i32.const 0)
    (loop $L (result i32)
      (if (result i32) (i32.const 1) (then (i32.const 2)) (else (i32.const 3)))
      (br_table 0 0)
    )
  )
 )
 "type mismatch"
)