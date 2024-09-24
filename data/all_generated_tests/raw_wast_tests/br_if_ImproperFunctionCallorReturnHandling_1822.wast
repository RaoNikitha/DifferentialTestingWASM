;; 3. Implement a test where a `br_if` targets a `call_indirect` that calls a function returning multiple values. This will verify if the wizard_engine correctly retrieves label arguments and branches to the indirect function with proper stack handling.

(assert_invalid
  (module
    (type $sig (func (result i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) $foo)
    (func $foo (result i32 i32) (i32.const 1) (i32.const 2))
    (func (param i32)
      (block
        (i32.const 0)
        (br_if 0 (call_indirect (type $sig) (local.get 0)))
      )
    )
  )
  "type mismatch"
)