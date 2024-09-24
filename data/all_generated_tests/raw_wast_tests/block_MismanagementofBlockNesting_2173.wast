;; 4. **Test Description**:    Design a WASM module with a sequence of nested `block` instructions which include a `br_if` targeting an outer block from the innermost level upon reaching a specific condition. This checks if the implementations accurately handle the conditional branch within deeply nested structures.

(assert_invalid
  (module (func $deeply_nested_br_if (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_if 3 (i32.const 1) (i32.const 0))
          )
        )
      )
    )
  ))
  "type mismatch"
)