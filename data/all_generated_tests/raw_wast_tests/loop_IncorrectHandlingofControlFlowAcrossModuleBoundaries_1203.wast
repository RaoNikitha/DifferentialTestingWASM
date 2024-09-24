;; 4. **Test 4**:    - Description: Create a nested loop structure where the inner loop performs a `br_table` instruction branching to the outer loop after an imported function call.    - Specific Constraint: `br_table` instruction should correctly manage operand stacks when jumping across loop boundaries after an external function call.    - Control Flow Relation: Tests complex branching involving multiple loops and module transitions.

(assert_invalid
  (module
    (func $nested-loops-br_table-with-external-call (import "env" "external_func") (param i32) (result i32)
      (local i32)
      (i32.const 0)
      (loop (param i32)(result i32)
        local.get 0
        (call $nested-loops-br_table-with-external-call)
        (br_table 0 0)
      )
    )
  )
  "type mismatch"
)