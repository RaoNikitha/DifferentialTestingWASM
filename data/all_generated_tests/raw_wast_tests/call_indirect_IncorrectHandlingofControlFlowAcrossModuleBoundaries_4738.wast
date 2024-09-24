;; Construct a test involving two WebAssembly modules where Module A calls an indirect function from a table within Module B that further calls another indirect function within Module B. Ensure that when control returns to Module A, the operand stack has the correct values indicating proper control flow handling.

(assert_invalid
  (module
    (import "modB" "table" (table 1 funcref))
    (import "modB" "indirectFunc" (func $indirectFunc (param i32)))
    (type (func (result i32)))
    (func $main
      (call_indirect (type 0) (i32.const 0))
    )
    (export "main" (func $main))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (table $table (export "table") 1 funcref)
    (type $typeA (func (result i32)))
    (type $typeB (func (param i32)))
    (func $funcA (type $typeA) (i32.const 42))
    (func $funcB (type $typeB) (call_indirect (type 0) (i32.const 0)))
    (elem (i32.const 0) $funcA)
    (export "indirectFunc" (func $funcB))
  )
  "type mismatch"
)