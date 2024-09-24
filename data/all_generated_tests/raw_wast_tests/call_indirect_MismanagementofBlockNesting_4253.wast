;; 2. **Test Description**: A `call_indirect` instruction inside a conditional branch that is itself within another conditional branch, with different expected function signatures at each nesting level. This tests if the type mismatches are properly trapped at each nesting level.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) func $nested1)
    (func $nested1 (param i32) (call_indirect (type 1) (i32.const 0) (i32.const 1)))
    (func
      (if (i32.const 1)
        (then
          (if (i32.const 1)
            (then (call_indirect (type 0) (i32.const 0) (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)