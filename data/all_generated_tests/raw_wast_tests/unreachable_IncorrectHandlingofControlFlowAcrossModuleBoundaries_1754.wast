;; 5. **Test 5: Conditional Call to `unreachable` in Exported Function**    - Description: Create a condition in the main module that branches to call an exported function if a certain condition is true. This exported function contains the `unreachable` instruction.    - Constraint Checked: Ensures conditional branches correctly handle traps from inter-module calls.    - Relation: Evaluates the integrity of conditionally branching control flows that lead to traps across module boundaries.

(assert_invalid
  (module
    (func $unreachable_func (unreachable))
    (func (export "main")
      (if (i32.const 1)
        (then (call $unreachable_func))
      )
    )
  )
  "type mismatch"
)