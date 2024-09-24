;; 4. **Test: Stack Operations with Imported Functions**    - Description: An imported function with specific parameter and return types is called indirectly. The test checks if the stack correctly handles pushing and popping arguments as well as return values.    - Constraint Checked: Operand handling and stack operations according to function signature.    - Related to Control Flow: Ensures correct stack management across functions from different modules.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (type (func (param i32) (result i32)))
    (func (result i32)
      (call_indirect (type 0) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)