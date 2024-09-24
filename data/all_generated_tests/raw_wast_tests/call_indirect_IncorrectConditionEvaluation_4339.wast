;; Evaluate the `call_indirect` instruction after a `br_if` where the condition causes the index to be out of bounds, ensuring that traps are handled correctly.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $test
      (block
        (br_if 0 (i32.const 1) (i32.const 0))
        (call_indirect (type 0) (i32.const 2) (i32.const 0))
      )
    )
  )
  "out of bounds table index"
)