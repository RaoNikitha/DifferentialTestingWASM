;; 3. **Test 3: Return from Exported Function**    - Description: Setup a module that exports a function which ends in a return instruction and invoke this function from another module.    - Relation: This test validates if the exported function's return instruction is properly understood and handled by the importing module.

(assert_invalid
  (module
    (func $exportedFunc (export "exportedFunc") (result i32)
      (i32.const 42)
      (return)
    )
    (func (import "env" "importedFunc"))
    (func (call $exportedFunc))
  )
  "type mismatch"
)