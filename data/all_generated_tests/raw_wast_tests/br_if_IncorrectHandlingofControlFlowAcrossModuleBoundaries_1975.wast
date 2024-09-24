;; 6. **Test 6: Calling Imported Functions with Conditional Branches Causing Stack Changes**    - **Description**: Test nested conditional branches within a loop that calls an imported function, affecting control flow. Validate that both WASM and wizard_engine effectively maintain and adjust stack states correctly across module boundaries during conditional branching.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test
      (block
        (loop
          (block
            (call $external_func (i32.const 1))
            (br_if 1 (call $external_func (i32.const 0))) ;; Test conditional branching with an imported function
          )
        )
      )
    )
  )
  "type mismatch"
)