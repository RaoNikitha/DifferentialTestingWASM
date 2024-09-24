;; 10. **Test 10**:     - **Description**: Sequence of nested `loop` blocks where each loop performs a `call` to functions with non-uniform parameter types and return types.     - **Constraint Checked**: Verifies that stack values and function call results are appropriately managed in nested loops.     - **Relation to Block Nesting**: Ensures the correct handling of stack manipulations and type checking within nested loops performing function calls.  With these descriptions, specific differential tests can be developed to deeply analyze and contrast how the WebAssembly and wizard_engine implementations handle block nesting and stack management.

(assert_invalid
  (module
    (func $inner1 (param i32) (result i32) (local.get 0) (i32.add (i32.const 1)))
    (func $inner2 (param i32) (result i32) (local.get 0) (i32.add (i32.const 2)))
    (func $nested-loop-calls
      (param i32)
      (result i32)
      (local.get 0)
      (loop $outer
        (loop $inner
          (call $inner1 (local.get 0))
          (call $inner2 (local.get 0))
          br_if $inner (i32.const 1)
        )
        br_if $outer (i32.const 1)
      )
    )
  )
  "type mismatch"
)