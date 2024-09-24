;; Test a block containing a `call_indirect` instruction with a mismatched function type but an in-bounds table index. This will check how the two implementations handle type checking within the block context, leading to either an error at type check or potential wrong function execution.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $func (param i32) (result i32) (i32.const 0))
    (elem (i32.const 0) $func)
    (func $type-check-block
      (block
        (call_indirect (type $sig) (i32.const 0) (i32.const 42))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)