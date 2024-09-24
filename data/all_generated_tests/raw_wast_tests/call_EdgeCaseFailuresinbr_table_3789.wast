;; 8. Create a function with a sequence of parameter-consuming calls leading to a `br_table` instruction. Point the `br_table` index to exactly one past the valid targets. This ensures the type-checking mechanism of Wizard_engine via `checkSignature` is thoroughly tested against that of WebAssembly.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (func $test-func (param i32 i32)
      (call $consume-params (i32.const 1) (i32.const 2))
      (call $consume-params (i32.const 3) (i32.const 4))
      (br_table 0 1 (i32.const 2))
    )
    (func $consume-params (param i32 i32))
  )
  "invalid br_table target"
)