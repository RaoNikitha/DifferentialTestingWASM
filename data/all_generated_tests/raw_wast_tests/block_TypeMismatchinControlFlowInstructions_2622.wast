;; - **Test 3 Description**:   Test a nested `block` where the inner `block` expects `i64` but the context provides `i32`. The test checks if improper type propagation through nested blocks is correctly caught by the respective engines and whether control structures adhere to their defined type contexts.

(assert_invalid
  (module
    (func (block (result i32)
            (block (result i64)
              (i32.const 10)
              (br 0)
            )
            (i32.const 20)
    ))
  )
  "type mismatch"
)