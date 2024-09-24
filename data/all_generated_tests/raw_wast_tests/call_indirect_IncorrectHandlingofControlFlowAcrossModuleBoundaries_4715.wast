;; Create a scenario where a function exported by one module, with the type `(i64) -> (i32, i32)`, is imported by another module. Use the importing module to make an indirect call with incorrect return type handling, ensuring the stack is managed correctly.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (type 0)))
    (type (func (param i64) (result i32 i32)))
    (table funcref (elem $external_func))
    (func (result i64)
      (call_indirect (type 0) (i32.const 0) (i64.const 42))
    )
  )
  "type mismatch"
)