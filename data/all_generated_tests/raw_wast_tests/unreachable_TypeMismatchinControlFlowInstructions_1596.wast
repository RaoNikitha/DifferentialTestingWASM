;; 7. Define an `if` condition that pushes different types (e.g., `i32` in the then branch and `f32` in the else branch) and use `unreachable` in one branch. Check if type consistency is maintained across branches.

(assert_invalid
  (module (func $type-if-condition-push-different-types (result i32)
    (if (i32.const 1)
      (then (i32.const 1))
      (else (unreachable) (f32.const 1))
    )
  ))
  "type mismatch"
)