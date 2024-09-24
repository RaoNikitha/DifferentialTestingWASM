;; 4. **Test Description:** Construct a block containing multiple `call_indirect` instructions with different type indices, concluding with a `br` instruction targeting an outer block. Validate if the call targets are correct and if the stack state is accurately restored.

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func (result i64)))
    (func $test
      (block
        (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
        (call_indirect (type $sig2) (i32.const 0) (i32.const 1))
        (br 0)
      )
    )
  )
  "type mismatch"
)