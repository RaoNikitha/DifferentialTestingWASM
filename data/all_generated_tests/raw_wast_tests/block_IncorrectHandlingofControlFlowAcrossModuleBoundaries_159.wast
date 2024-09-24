;; 10. **Nested Blocks with Interleaved Imports and Exports**:     - Construct a function with deeply nested `blocks`, with each block containing interactions with imported and exported functions. The test scenario includes various branching and control flow challenges, checking if `wizard_engine` and WebAssembly handle label indexing and nested contexts properly across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (export "test_func" (func $test_func))
    (func $test_func (result i32)
      (i32.add
        (block $outer (result i32)
          (i32.mul
            (block $inner (result i32)
              (i32.const 10)
              (call $external_func)
              (br 1 (i32.const 20))
            )
            (i32.const 2)
          )
        )
        (i32.const 5)
      )
    )
  )
  "type mismatch"
)