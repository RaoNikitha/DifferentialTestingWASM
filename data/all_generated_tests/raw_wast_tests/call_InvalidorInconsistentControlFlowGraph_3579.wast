;; 8. **Forward Function Declaration**:    Write a test where a function is called before it is declared, relying on forward declarations. This checks the CFG’s ability to manage and validate function calls ahead of their actual declarations in code.

(assert_invalid
  (module
    (func (result i32)
      (call 1 (i32.const 0))
    )
    (func (param i32) (result i32)
      ;; This function is declared after it is called
      (i32.add (local.get 0) (i32.const 1))
    )
  )
  "unknown or out-of-bounds function"
)