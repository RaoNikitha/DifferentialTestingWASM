;; **Test 8**: Generate a WASM module combining `call_indirect` instructions with non-function reference tables that lead to polymorphic type issues. This focuses on handling complex type mismatches and verifying if improper CFG setups lead to inconsistencies such as unpopulated operand stacks or misdirected branches.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 externref)
    (func (result i32)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)