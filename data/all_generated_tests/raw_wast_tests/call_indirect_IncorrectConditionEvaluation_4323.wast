;; 2. **Test 2**: Use an out-of-bounds table index for the `call_indirect` instruction. Validate that both implementations correctly trap, but vary the boundaries slightly to ensure any specific boundary condition differences (like an off-by-one error) are caught in the implementation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 10 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 10))
    )
  )
  "out of bounds table index"
)