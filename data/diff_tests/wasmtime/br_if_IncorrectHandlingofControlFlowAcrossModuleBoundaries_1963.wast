;; 4. **Test Description**:     - **Scenario**: Create a function in `ModuleA` that enters a loop, calls an imported function from `ModuleB`, where `ModuleB` uses `br_if` to attempt a backward jump.    - **Constraint Checked**: Correct return of control to the loop start in `ModuleA` without unintended stack modification.    - **Relation to Control Flow**: Validates backward jumps in loops with inter-module function calls.

(assert_invalid
 (module
  (import "ModuleB" "func" (func $importedFunc))
  (func $testFunc
   (loop
    (call $importedFunc)
    (br_if 0 (i32.const 1))
   )
  )
 )
 "invalid label"
)