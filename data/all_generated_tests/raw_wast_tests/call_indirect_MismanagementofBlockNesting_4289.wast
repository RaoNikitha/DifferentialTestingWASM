;; Formulate a scenario with a deeply nested structure involving multiple tables and types. Place `call_indirect` at different depths and use `br` to alter control flow, ensuring both implementations handle nested blocks and function calls correctly without mismanaging nesting.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (param i32) (result i32)
      local.get 0
    )
    (func $nested1
      (block
        (loop
          (br 1)
          (call_indirect $sig1 (i32.const 0) (i32.const 0))
        )
      )
    )
    (func $nested2 (param i32)
      (block (result i32)
        (loop (param i32)
          (br 1)
          (call_indirect $sig2 (i32.const 0) (i32.const 0))
        )
        (br 0)
      )
    )
    (export "nested1" (func $nested1))
    (export "nested2" (func $nested2))
  )
  "type mismatch"
)