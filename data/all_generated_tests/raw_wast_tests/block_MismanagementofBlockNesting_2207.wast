;; 8. Create nested `block` and `if` conditions, where a `br_if` inside a deep nested `block` targets an outer block but misaligns with a `br` targeting the same label. Ensure implementations validate correct branch depth resolution.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_if 3 (i32.const 1)) (br 2))
        )
      )
    )
  ))
  "type mismatch"
)