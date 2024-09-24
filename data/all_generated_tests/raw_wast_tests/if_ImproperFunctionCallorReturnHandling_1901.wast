;; 2. **Indirect Call to Non-existent Function**:    - Use `call_indirect` within an `if` block with an invalid function index.    - Validate if it correctly traps or leads to a faulty execution.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table 1 funcref)
    (func $test (result i32)
      (i32.const 0)
      (if (result i32)
        (then
          (call_indirect (type $t) (i32.const 1))
        )
      )
    )
  )
  "call indirect to non-existent function"
)