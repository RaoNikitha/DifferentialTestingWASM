;; 4. **Test Description 4**:    Design a case where a WASM module uses a `block` that calls a deeply nested function from another module with `br` instructions targeting different block levels. Ensure that the control flow returns to the appropriate block level after the call.

(assert_invalid
  (module
    (func (import "env" "nested_func_imported"))
    (func $deep-nested
      (block 
        (block
          (call 0)
          (br 1)
        )
        (nop)
      )
    )
  )
  "type mismatch"
)