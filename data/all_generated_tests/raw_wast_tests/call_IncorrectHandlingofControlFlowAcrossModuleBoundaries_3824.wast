;; 3. **Test Exported Function Returns Multiple Values**:    - **Description**: Have a function that returns multiple values exported from one module and called from another module, validating if return values are correctly pushed onto the stack.    - **Constraint**: Ensures the return signature is accurately matched and values are correctly managed.    - **Relation**: Checks if multiple return values are correctly handled across module transitions.

(assert_invalid
  (module
    (module
      (type $twoval (func (result i32 i32)))
      (func $return_two (result i32 i32) (i32.const 1) (i32.const 2))
      (export "return_two" (func $return_two))
    )
    (import "env" "return_two" (func $imported_return_two (result i32 i32)))
    (func $call_import (result i32 i32)
      (call $imported_return_two)
    )
    (export "call_import" (func $call_import))
  )
  "type mismatch"
)