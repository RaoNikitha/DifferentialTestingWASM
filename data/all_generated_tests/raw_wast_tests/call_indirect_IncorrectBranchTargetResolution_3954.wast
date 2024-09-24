;; 3. **Test Description 3**:    - Design a WebAssembly test that uses `call_indirect` within a block that immediately follows a `br` instruction targeting another block's end. Ensure the block label resolution is critical here. The test should detect if the `call_indirect` incorrectly follows this branch target by possibly choosing a wrong function type or call.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $callee (param i32) (result i32) (local.get 0))
    (elem (i32.const 0) func $callee)
    (func $test
      (block
        (i32.const 42)
        (block
          (br 1)
          (call_indirect (type 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)