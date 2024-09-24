;; 2. **Module Transition with Type Mismatch**:    - Use a block to call a function from an imported module where the block’s type is mismatched with the function’s return type. This tests if the implementation correctly handles type mismatches during module boundary transition.

(assert_invalid
  (module
    (import "external" "func" (func $external_func (result i32)))
    (func $type-mismatch-block (result i64)
      (block (result i64) (call $external_func))
    )
  )
  "type mismatch"
)