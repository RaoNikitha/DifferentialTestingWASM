;; 2. **Test Description**:     - **Scenario**: A function in `ModuleA` calls an imported function from `ModuleB`, which itself calls another function from `ModuleC` containing a `br_if` instruction pointing to its third label of nested blocks.    - **Constraint Checked**: Correctness of nested label reference across multiple module calls.    - **Relation to Control Flow**: Ensure `br_if` respects the relative label depth even when multiple modules are involved in the control flow.

(assert_invalid
  (module
    (import "ModuleB" "imported_func" (func $imported_func (param i32)))
    (func (export "ModuleA_func")
      (i32.const 5)
      (call $imported_func)
    )
  )
  "type mismatch"
)