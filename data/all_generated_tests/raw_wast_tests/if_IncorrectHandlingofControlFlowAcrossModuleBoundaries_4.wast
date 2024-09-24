;; 5. **Test Description:**    Within an `if` construct, have the `then` block call multiple imported functions in sequential order. Verify that stack changes and control flow are appropriately managed across module boundary calls when the condition is true.

(assert_invalid
  (module
    (import "env" "func1" (func $func1 (result i32)))
    (import "env" "func2" (func $func2))
    (func (result i32)
      (if (result i32) (i32.const 1)
        (then (call $func1) (call $func2) (call $func1))
        (else (call $func1))
      )
    )
  )
  "type mismatch"
)