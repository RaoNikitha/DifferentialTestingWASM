;; Test Description 10: A `block` with a `br_if` instruction dependent on the result of a comparative operation (e.g., `<`, `>`, `==`). Ensure the branch operation only executes based on accurate results from these comparative operation evaluations.

(assert_invalid
  (module (func $block-with-conditional-branch (result i32)
    (local i32)
    (i32.const 3)
    (i32.const 5)
    (i32.lt_s)
    (block (result i32) 
      (br_if 0 (local.get 0))
      (i32.const 9)
    )
  ))
  "type mismatch"
)