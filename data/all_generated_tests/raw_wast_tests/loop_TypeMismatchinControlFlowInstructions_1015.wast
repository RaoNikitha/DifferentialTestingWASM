;; 6. **Type Mismatch When Reinitializing Loop Execution**: Define a loop where reinitialization via a branch (targeting the loop itself) leads to a type inconsistency between the operand stack at the point of the branch and the expected stack state at loop entry. This will test the consistency of type checking during loop re-entry.

(assert_invalid
  (module
    (func $type-mismatch-reentry
      (result i32)
      (i32.const 0)
      (loop (result i32)
        (br 0)
        (f32.const 1.0)
      )
    )
  )
  "type mismatch"
)