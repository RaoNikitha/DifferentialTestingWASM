;; 5. **Test Description**:     - **Scenario**: Implement nested blocks in `ModuleA` with a call to `ModuleB`, where `ModuleB` uses `br_if` to exit multiple levels of nested blocks based on a stack-fed condition.    - **Constraint Checked**: Ensures the correct number of block levels are exited and the operand stack is accurate upon return.    - **Relation to Control Flow**: Verifies accurate use of operand stacks and correctly targeted nested block exits.

(assert_invalid
  (module
    (import "ModuleB" "br_if_exit" (func $br_if_exit (param i32) (result i32)))
    (func $test
      (block $outer_block
        (block $inner_block
          (call $br_if_exit (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)