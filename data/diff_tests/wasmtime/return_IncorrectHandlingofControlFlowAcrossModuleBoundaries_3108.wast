;; 7. **Test Description**: Import a function within multiple nested blocks containing intermediate returns and ensure the module boundary transition doesn't cause operand stack corruption after each return.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $test (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (call $imported_func)
            (return)
            (i32.const 0)
          )
          (return)
          (i32.const 0)
        )
        (return)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)