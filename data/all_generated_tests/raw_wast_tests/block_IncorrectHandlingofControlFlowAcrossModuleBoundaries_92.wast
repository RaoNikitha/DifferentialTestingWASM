;; 3. **Nested block with import calls**:    - Create a nested block structure with inner blocks making calls to imported functions.    - Check if the nesting level is correctly handled when control flow crosses module boundaries, and that the stack is correctly unwound and resumed.

(assert_invalid
  (module
    (import "env" "func" (func $importedFunc (param i32) (result i32)))
    (func $nestedBlockWithImports (result i32)
      (i32.const 0)
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (i32.const 2)
          (call $importedFunc)
          (br 1)
        )
        (call $importedFunc)
      )
    )
  )
  "type mismatch"
)