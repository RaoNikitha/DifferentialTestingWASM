;; 2. A `block` containing multiple nested blocks with conditions checked within each. Use `br_if` with false conditions. This tests nesting and condition evaluations to ensure no incorrect branch is taken.

(assert_invalid
  (module (func $block-multiple-nested-conditions (result i32)
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (i32.const 2)
        (block (result i32)
          (i32.const 3)
          (br_if 0 (i32.const 0)) ; this will not branch
          (i32.const 4) ; should be executed
        )
        (br_if 0 (i32.const 0)) ; this will not branch
        (i32.const 5) ; should be executed
      )
      (br_if 0 (i32.const 0)) ; this will not branch
      (i32.const 6) ; should be executed
    )
  ))
  "type mismatch"
)