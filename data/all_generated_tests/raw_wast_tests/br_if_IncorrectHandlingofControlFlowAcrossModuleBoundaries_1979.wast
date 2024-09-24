;; 10. **Test 10: Complex Nested Functions with Import/Export and Conditional Branches**    - **Description**: Construct a more complex scenario with deeply nested functions in between modules, involving multiple `br_if` instructions. Test the integrity of the operand stack and control flow management when branching conditionally across module boundaries, verifying consistency between WASM and wizard_engine.

(assert_invalid
  (module
    (import "math" "add" (func $add (param i32) (param i32) (result i32)))
    (func $type-mismatch
      (block
        (i32.const 0)
        (if (result i32) (then (br_if 1 (i32.const 1))))
      )
      (call $add (i32.const 1) (i64.const 1))
    )
    (export "main" (func $type-mismatch))
  )
  "type mismatch"
)