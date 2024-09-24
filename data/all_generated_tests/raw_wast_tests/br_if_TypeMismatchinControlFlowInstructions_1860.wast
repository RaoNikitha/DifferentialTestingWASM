;; - **Test 1**:   Create a `block` containing a `br_if` instruction, where the `block` expects a `f32` result type, but the `br_if` is given an `i32` operand for the conditional check.   - **Reason**: This tests if the implementations correctly enforce type constraints within blocks.   - **Constraint**: `[t* i32] ! [t*]` should match the block’s result type expectation.

(assert_invalid
  (module 
    (func
      (block (result f32) (br_if 0 (i32.const 1)))
    )
  )
  "type mismatch"
)