;; - Test Description 2: Construct a loop with a nested `br_if` that depends on a boolean flag pushed to the stack shortly before the branch. Ensure that the flag is false to test if the `br_if` does not incorrectly take the branch.

(assert_invalid
  (module
    (func $nested-br_if
      (loop (result i32)
        i32.const 0
        i32.const 1
        br_if 0
        end
      )
  )
  "type mismatch"
)