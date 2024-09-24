;; 7. **Test 7: Recursive Function with Unreachable**    - Description: Use an `unreachable` inside a recursively calling function.      - *Constraint:* Ensures recursive calls do not continue once the trap is hit.      - *Improper Handling Check:* Verifies the handling of recursion and premature trapping.

(assert_invalid
  (module (func $recursive-unreachable
    (result i32)
    (local i32)
    (local.set 0
      (i32.add (i32.const 1) (call $recursive-unreachable))
    )
    (unreachable)
  )
  (func (export "test") (result i32)
    (call $recursive-unreachable)
  ))
  "type mismatch"
)