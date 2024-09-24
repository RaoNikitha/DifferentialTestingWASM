;; 9. **Test Description:**    - Place `unreachable` within an `else` clause of an `if` statement where the `if` part modifies the stack type differently, causing a mismatch expectation.    - **Constraint Checked:** Verifies consistent type checking across `if-else` constructs including where `unreachable` is used.    - **Relation to Type Mismatch:** Ensures coherent stack typing across conditional branches with `unreachable`.

(assert_invalid
  (module (func $type-cond-unreachable-in-else-mismatched
    (if (i32.const 1)
      (then (i32.const 0))
      (else (unreachable) (f32.const 0))
    )
  ))
  "type mismatch"
)