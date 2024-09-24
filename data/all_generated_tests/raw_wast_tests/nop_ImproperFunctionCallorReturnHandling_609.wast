;; 10. **Test 10**: Position `nop` between a `call_indirect` and a `return` instruction within a block. Ensure the `nop` doesn’t affect the function lookup for `call_indirect` and that the block returns as expected.

(assert_invalid
  (module
    (table 0 anyfunc)
    (func $type-i32-i32-vs (result i32)
      (block 
        (call_indirect (type $type-i32-i32-vs) (nop))
        (return (i32.const 0))
      )
    )
    (type $type-i32-i32-vs (func (result i32)))
  )
  "type mismatch"
)