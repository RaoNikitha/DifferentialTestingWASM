;; 5. **Test with Mixed `block` and `loop` Structures:**    - Design a blend of `block` and `loop` structures and perform a branch from a `loop` to a `block`. Ensure the stack unwinding and restoration match expected operand types and counts at the branch target.

(assert_invalid
  (module
    (func $mixed-block-loop
      (block (result i32)
        (loop
          (block (result i32)
            (i32.const 0)
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)