;; 4. **Call Indirect Mismatch with Br:**    Use `call_indirect` to call functions stored in a table, including a `br` instruction in these functions targeting different blocks. Ensure valid type checking and function lookup, checking if the `br` instruction within the indirect calls affect return behavior.

(assert_invalid
  (module
    (table 1 funcref)
    (type $ft (func (result i32)))
    (func $call_target
      (block (result i32)
        (br 0) (i32.const 0)
      )
    )
    (elem (i32.const 0) $call_target)
    (func $test_call_indirect
      (block (result i32)
        (call_indirect (type $ft) (i32.const 0))
        (br 0)
      )
    )
  )
  "type mismatch"
)