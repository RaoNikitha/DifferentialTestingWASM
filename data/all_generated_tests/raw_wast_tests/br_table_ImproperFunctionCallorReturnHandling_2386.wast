;; 6. Test the scenario where the `br_table` branches to labels containing `call_indirect` followed by `return`. Validate if the function signature and indirect table indexing lead to the correct callee functions and proper returning.

(assert_invalid
  (module
    (table 2 funcref)
    (type $sig (func (result i32)))
    (func $invalid (param i32) (result i32)
      (block (result i32)
        (call_indirect (type $sig) (local.get 0) (i32.const 0))
        (br_table 0 (i32.const 0))
        (return)
      )
    )
    (elem (i32.const 0) $invalid $invalid)
  )
  "type mismatch"
)