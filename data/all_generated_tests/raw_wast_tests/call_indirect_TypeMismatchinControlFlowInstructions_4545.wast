;; 4. **Test Description**: Implement a `call_indirect` inside a `block` instruction, where the block’s result type is `i32`, but the indirectly called function returns multiple values of types `i32`, `f64`.    - **Constraint**: Ensures proper checks against block type restrictions when using indirect calls.    - **Relation**: Validates that the module enforces block type constraints during indirect function calls.

(assert_invalid
  (module
    (type (func (result i32 f64)))
    (import "env" "imported_func" (func $imported_func (result i32 f64)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (func $block-indirect
      (block (result i32)
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)