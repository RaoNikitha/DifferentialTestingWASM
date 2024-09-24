;; 8. **Nested `block` with `loop` and Combined Branching**:    - Combine nested `block` and `loop` instructions with both backward and forward branching using `br` and `br_if`. Validate that branches exit the correct block and loop scopes. Incorrect control flow handling can cause unexpected exits from nested control structures.

(assert_invalid
  (module
    (func $nested-block-loop (result i32)
      (i32.const 0)
      (block (result i32)
        (loop (result i32)
          (br_if 1 (i32.const 1))
          (i32.const -1)
          (br 0)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)