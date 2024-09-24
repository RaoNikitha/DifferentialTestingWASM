;; 5. **Test Description:** Set up a WASM function that starts with multiple nested `block` structures, use `br` to break to an outer block, followed by invoking an imported function containing its own nested control instructions.    **Specific Constraint:** This checks correct operand handling and control transition upon breaking out of deeply nested blocks.    **Relation to Control Flow Boundaries:** Ensures breaking to outer scopes before crossing module boundaries doesn't lead to stack issues.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func
      (block
        (block
          (block
            (br 2)
          )
          (call $external_func)
        )
      )
    )
  )
  "type mismatch"
)