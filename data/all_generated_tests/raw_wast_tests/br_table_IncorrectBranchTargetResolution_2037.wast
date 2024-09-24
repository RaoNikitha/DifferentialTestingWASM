;; 8. **Indirect Jump in Loop with Invalid Index:**    - Build a loop with a `br_table` that has an invalid index and should jump to a default target. Verify the loop behavior when branching.    - *Testing for*: Accurate default label targeting in looping structures.    - *Constraint*: Operand stack management and control flow.

(assert_invalid
  (module
    (func $loop-invalid-index
      (loop
        (block
          (br_table 0 1 (i32.const 10))
        )
      )
    )
  )
  "unknown label"
)