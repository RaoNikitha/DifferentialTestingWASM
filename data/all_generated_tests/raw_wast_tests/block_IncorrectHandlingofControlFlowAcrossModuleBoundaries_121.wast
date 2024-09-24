;; 2. Define a `block` that calls an imported function which itself contains another `block`. The imported function should return a value to verify if the stack is correctly managed across nested blocks and module boundaries.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $test-block-nested-imported (result i32)
      (block (result i32)
        (call $imported_func)
      )
    )
    (func $imported_func
      (block
        (br 0)
      )
    )
  )
  "type mismatch"
)