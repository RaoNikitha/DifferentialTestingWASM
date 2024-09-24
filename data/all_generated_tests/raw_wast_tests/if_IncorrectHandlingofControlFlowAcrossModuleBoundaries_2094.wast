;; 5. **Test 5: Nested If Blocks with Cross-Module Calls**:    - Description: Nest multiple `if` instructions with cross-module function calls within both `then` and `else` blocks, validating stack consistency and control flow.    - Specific Constraint: Stack consistency and label handling across nested `if` instructions with cross-module calls.    - Relation to Control Flow: Ensures deeper nested control flows and calls across module boundaries manage stacks correctly.

(assert_invalid
 (module 
  (import "env" "func" (func $imported_func (param i32) (result i32)))
  (func $test_nested_if (result i32)
    (i32.const 1)
    (if (result i32)
      (i32.const 1) 
      (then
        (call $imported_func (i32.const 10))
        (if (result i32)
          (i32.const 1)
          (then (call $imported_func (i32.const 20)))
          (else (i32.const 30))
        )
      )
      (else
        (call $imported_func (i32.const 40))
        (if (result i32)
          (i32.const 0)
          (then (i32.const 50))
          (else (call $imported_func (i32.const 60)))
        )
      )
    )
  )
 )
"unreachable code reached"
)