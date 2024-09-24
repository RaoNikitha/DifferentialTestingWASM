;; 9. Use `br_table` with an index operand that is zero but the corresponding label is outside the function body but within nested control structures. It tests the proper resolution of labels within complex control contexts.

(assert_invalid
  (module
    (table 1 funcref)
    (type $funcType (func (result i32)))
    (func $targetFunction (result i32)
      (return (i32.const 42))
    )
    (func (result i32)
      (block $outer
        (loop $inner
          (call_indirect (type $funcType) (i32.const 0))
        )
        (br_table 0 1 0) ;; label resolution
      )
    )
  )
  "type mismatch"
)