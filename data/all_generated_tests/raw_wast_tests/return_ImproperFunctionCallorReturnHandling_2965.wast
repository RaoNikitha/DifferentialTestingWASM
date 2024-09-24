;; 4. Simulate an indirect function call (`call_indirect`) where the table index is incorrect. Ensure WebAssembly throws an invalid table index error, while Wizard Engine's handling is validated for potential incorrect type checking.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem))
    (func $type-mismatch-in-call_indirect (result i32)
      (block (result i32)
        (call_indirect (type $sig)
          (i32.const 0) (return)
        )
      )
    )
  )
  "type mismatch"
)