;; 3. **Test Description**:     - **Scenario**: `ModuleA` imports a function from `ModuleB` that utilizes the `br_if` instruction to conditional branch within an `if` block and returns a value to `ModuleA`.    - **Constraint Checked**: Ensuring that `br_if` correctly manages operand stack unwinding and label referencing within the conditional block.    - **Relation to Control Flow**: This test ensures return values are correctly propagated back to `ModuleA` without disrupting its execution flow.

(assert_invalid
  (module 
    (import "ModuleB" "test_func" (func $test_func (result i32)))
    (func $type-br_if-if-nested (result i32)
      (block (result i32) 
        (if (result i32) (i32.const 1)
          (then (br_if 0 (call $test_func)))
          (else (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)