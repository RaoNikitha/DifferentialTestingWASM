;; 10. Use a block that involves multiple type transitions and stack manipulations with a `call_indirect` instruction branching out of the block's context, checking if the correct stack unwinding and type checks are enforced during indirect calls. This validates comprehensive CFG generation when involving more complex instruction sets.

(assert_invalid
  (module
    (type $func_type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $foo)
    (func $foo (param i32) (result i32)
      (local.get 0)
    )
    (func (result i32)
      (block (result i32)
        (i32.const 42)
        (call_indirect (type $func_type) (i32.const 0))
        (drop)
        (br 0 (f64.const 3.14))
      )
    )
  )
  "type mismatch"
)