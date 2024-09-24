;; 8. **Test Case 8**: Design a loop that calls an imported function performing complex operations (e.g., arithmetic) and returns values that dictate the loop's branching instructions (`br_if`). This test checks for any differential handling in the computation result handling between the original and imported module contexts.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32)
      (local i32)
      (loop (result i32)
        (call $external_func)
        (br_if 1)
      )
    )
  )
  "type mismatch"
)