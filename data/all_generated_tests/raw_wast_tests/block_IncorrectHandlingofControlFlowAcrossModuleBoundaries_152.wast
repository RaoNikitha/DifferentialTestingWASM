;; 3. **Exported Function Returning to Nesting Context**:    - Implement a module that exports a function with a `block` containing a `call` to an imported function. The imported function should then return and execute further instructions. The test aims to check that control flow and label handling are consistent between `wizard_engine` and WebAssembly.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func (result i32)
      (block (result i32)
        (call $externalFunc)
        (i32.add (i32.const 1) (call $externalFunc))
      )
    )
  )
  "type mismatch"
)