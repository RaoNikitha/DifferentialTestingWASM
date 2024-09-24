;; 5. **Test 5: Nested Blocks with Conditional Branch and Return from Imported Function**    - **Description**: Implement nested blocks with a `br_if` instruction that leads to returning from an imported function. Verify if stack unwinding and relative label referencing are consistently managed across both environments upon returning.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test-nested-blocks-import-return (result i32)
      (block (result i32)
        (block (result i32)
          (call $external_func)
          (br_if 1 (i32.const 1))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)