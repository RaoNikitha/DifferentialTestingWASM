;; 2. **Nested Block with Imported Function Call**:    - Design a module that imports a function and calls it within a nested `block`. Ensure the imported function includes branching instructions. The test verifies that both implementations correctly unwind the operand stack and handle labels across module boundaries during the `call`.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $test-block-nested-import
      (block (result i32)
        (block (result i32)
          (call $externalFunc)
          (br 1))
        (i32.const 0))
      (i32.const 1))
  )
  "type mismatch"
)