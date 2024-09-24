;; 3. **Test 3: Nested Function Calls with Conditional Branching**: Execute multiple nested function calls that each contain a `br_if` instruction, validating proper label and context handling with correct unwinding of stacks post function return. Differences in nested depth handling might be revealed between WASM and `wizard_engine`.

(assert_invalid
  (module 
    (func $nested-func-call
      (block (result i32)
        (call $inner-func)
        (br_if 0 (i32.const 1))
        (i32.const 0)
      )
    )
    (func $inner-func
      (block (br_if 0 (i32.const 0)))
    )
  )
  "type mismatch"
)