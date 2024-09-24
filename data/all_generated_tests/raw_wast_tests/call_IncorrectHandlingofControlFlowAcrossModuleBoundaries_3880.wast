;; 9. **Indirect Call via Imported Function Table**:    - **Constraint Checked**: Tests indirect function calls using an imported function table.    - **Description**: Export a function table from module A and import it into module B. Then perform an indirect call from module B to a function indexed in the imported table, checking if stack and control flow are maintained correctly.

(assert_invalid
  (module
    (import "A" "table" (table 1 funcref))
    (func (param i32) (result i32) (i32.const 42))
    (type $sig (func (param i32) (result i32)))
    (func $type-indirect-imported
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)