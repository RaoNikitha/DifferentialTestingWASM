;; 3. **Test Description:** Place `unreachable` inside an `if` control flow, where the `else` branch has a type requirement (e.g., using `i32.const` followed by an `i32.add`).    **Constraint:** The `else` branch is expected to push integers, but `unreachable` in the `if` should cause a trap.    **Reasoning:** Verifies if the types assumed by the `else` branch are correctly invalidated by the `unreachable` trap.

(assert_invalid
  (module (func $test_unreachable_if_else
    (if (result i32)
      (i32.const 1)
      (then (unreachable))
      (else (i32.const 2) (i32.const 3) (i32.add))
    )
  ))
  "type mismatch"
)