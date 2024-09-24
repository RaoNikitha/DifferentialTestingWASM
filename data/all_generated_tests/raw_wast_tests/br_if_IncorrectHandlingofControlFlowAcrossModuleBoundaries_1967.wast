;; 8. **Test Description**:     - **Scenario**: `ModuleA` calls an imported function from `ModuleB`, with `ModuleB` calling back a function in `ModuleA` containing a `br_if` for breaking a loop with a conditional forward jump.    - **Constraint Checked**: Ensures the correct management and interpretation of label depth during a back-and-forth function call scenario.    - **Relation to Control Flow**: Verifies continuous stack integrity and accurate control flow across multiple module calls involving loops.

(assert_invalid
 (module
  (import "ModuleB" "funcB" (func $funcB (param i32)))
  (func $funcA
    (local i32)
    (i32.const 10)
    call $funcB
    loop (result i32)
     local.get 0
     br_if 1 (i32.const 1)
    end
   )
  )
)
"unknown label"
)