;; 4. **Test 4: Nested Calls and Returns Across Modules**    - Description: Define nesting of function calls where one module calls functions from another module, which in turn calls functions from the first module, all utilizing return instructions.    - Relation: This test checks if nested returns across module boundaries maintain correct stack and execution flow.

(assert_invalid
  (module
    (import "mod" "calledFunc" (func $calledFunc (result i32)))
    (func $type-value-empty-vs-num-in-nested-call (result i32)
      (call $calledFunc (return))
    )
  )
  "type mismatch"
)