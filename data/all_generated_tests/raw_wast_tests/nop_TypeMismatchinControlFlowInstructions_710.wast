;; 1. **Test 1: Nested Blocks with Incorrect Type Return and `nop`**    - Place a `nop` inside a nested block structure, where the innermost block has an incorrect type return statement. This checks if the `nop` influences type validation within nested blocks.    - **Constraint**: Ensures that `nop` does not affect type validation within nested blocks.    - **Type Mismatch Check**: Verifies if exiting innermost block assumes the correct type.

(assert_invalid
  (module
    (func (result i32)
      (block (result i64)
        (block $inner (result i64)
          nop
          i64.const 1
        )
        i32.const 0
      )
    )
  )
  "type mismatch"
)