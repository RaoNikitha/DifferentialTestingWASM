;; 6. **Test Description**:     - **Scenario**: An exported function from `ModuleA` is called from `ModuleB` and utilizes `br_if` to jump out of a deeply nested structure within `ModuleA`.    - **Constraint Checked**: Correct label depth calculation and handling within nested structures.    - **Relation to Control Flow**: Ensures that `br_if` accurately jumps to the designated block, effectively shifting control without execution discrepancies.

(assert_invalid
  (module
    (import "ModuleA" "funcA" (func $funcA))
    (func (export "funcB")
      (block (block (block (block (block
        (br_if 4 (i32.const 1))))))))
  )
  "unknown label"
)