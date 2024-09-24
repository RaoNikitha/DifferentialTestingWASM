;; 4. **Conditional Branch with Unreachable Due to Imported Function Result:**    - Have an imported function return a condition for a branch in the caller module, where one path leads to an `unreachable`. Verify if the trap correctly happens based on the result from the called function.    - **Constraint:** Verify the propagated control flow based on the imported function result, ensuring the `unreachable` path is accurately followed resulting in a trap.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (if (i32.eq (call $external_func) (i32.const 0))
        (then (unreachable))
      )
    )
  )
  "type mismatch"
)