;; 9. **Test: Multiple Table Indices with Imported Function**    - Description: A scenario where multiple table indices are used in the presence of an imported function and `call_indirect` accessing varying table depths to confirm correct table indexing and trapping on invalid indices.    - Constraint Checked: Table indexing and boundary conditions.    - Related to Control Flow: Ensures robustness in accessing different layers of function tables across modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external (param i32) (result i32)))
    (table 1 funcref)
    (type (func (param i32) (result i32)))
    (func $type-redundant (param i32) (result i32)
      (call_indirect (type 0) (nop) (i32.const -1))  ;; Trying to call with an invalid index
    )
  )
  "table out of bounds"
)