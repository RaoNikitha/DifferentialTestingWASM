;; 5. **Test Description 5:**    - **Focus:** Operand stack management across nested blocks with module calls.    - **Constraint:** Verify that the `br` instruction correctly handles operand stack across nested blocks that include module imports.    - **Incorrect Handling:** Operand stack mismatch during transitions between nested blocks and module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test-func
      (block
        (block (result i32)
          (block (result i32)
            (call $external_func)
            (br 2 (i32.const 42))
            (i32.const 1)
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)