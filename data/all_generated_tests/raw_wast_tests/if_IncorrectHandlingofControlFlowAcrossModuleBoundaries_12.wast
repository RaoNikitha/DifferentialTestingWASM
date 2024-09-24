;; 3. **Test Description**: Create an `if` instruction that branches to a block with `call_imported` instructions. The return value from the imported function is used in subsequent instructions.    - **Constraint Checked**: Proper unwinding of operand stack during `else` branch execution.    - **Test Relation**: Verifies if the operand stack is correctly managed when branching and calling functions crosses module boundaries.

(assert_invalid
  (module
    (import "env" "extFunc" (func $extFunc (param i32) (result i32)))
    (func $test-if-branch-with-import (param i32) (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call $extFunc (local.get 0))
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)