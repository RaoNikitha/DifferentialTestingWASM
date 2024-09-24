;; 3. Use `call_indirect` to jump to different functions, followed by a `br` instruction that targets an outer structured control block, testing if WebAssembly improperly returns control to the wrong function call point compared to wizard_engine.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1
      (block (result i32)
        (call_indirect (type $t) (i32.const 0))
        (br 1)
      )
    )
    (func (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)