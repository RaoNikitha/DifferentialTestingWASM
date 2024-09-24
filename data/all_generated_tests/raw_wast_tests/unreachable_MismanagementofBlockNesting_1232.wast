;; 3. **Test Description:** Employing `unreachable` within an `if` conditional nested inside a larger loop structure. This test checks if the control flow correctly handles the trap from `unreachable` and does not misinterpret the stack context of the enclosing structures.        **Constraint Checked:** Correct control flow management and trapping within nested conditional and loop structures.

(assert_invalid
  (module (func $nested-if-loop (result i32)
    (loop (result i32)
      (if (i32.const 1)
        (then (unreachable))
      )
      (i32.const 42)
    )
  ))
  "type mismatch"
)