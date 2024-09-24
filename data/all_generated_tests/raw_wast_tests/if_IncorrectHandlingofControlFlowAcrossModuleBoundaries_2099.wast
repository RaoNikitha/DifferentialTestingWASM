;; 10. **Test 10: Multiple Cross-Module Function Calls within Single If Block**:     - Description: Multiple calls to different imported functions from within a single `if` instruction, either within `then` or `else`, validating cumulative stack and control flow correctness.     - Specific Constraint: Verify that each call and its impacts on the stack and labels are consistent with `blocktype` across all module boundaries.     - Relation to Control Flow: Ensures cumulative effect of multiple cross-module calls within an `if` block maintains control flow integrity.

(assert_invalid
  (module
    (import "env" "foo" (func $foo (param i32) (result i32)))
    (import "env" "bar" (func $bar (param i32) (result i32)))
    (func (result i32)
      (i32.const 0)
      (if (result i32)
        (call $foo (i32.const 1))
        (then (call $bar (i32.const 2)) (i32.const 1))
        (else (call $foo (i32.const 3)) (call $bar (i32.const 4)))
      )
    )
  )
  "type mismatch"
)