;; 7. **Test Description**: Employ a `call_indirect` within a conditional that is entirely within a block, which in turn is nested in another block. The conditional could trap if operand order and type compliance are not handled correctly when moving up the block nesting.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func (result i32)
      (block
        (block
          (i32.const 0) (i32.const 0)
          (if (i32.const 1)
            (then (call_indirect (type 0) (i32.const 0)))
          )
        )
      )
    )
    (table 1 funcref)
    (elem (i32.const 0) $dummy)
    (func $dummy (param i32) (result i32) (i32.const 0))
  )
  "type mismatch"
)