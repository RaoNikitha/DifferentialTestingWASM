;; Test 7: Construct a block with multiple nested blocks where each has `br_if` instructions. Ensure that each `br_if` correctly evaluates its condition and branches appropriately, maintaining proper control flow.

(assert_invalid
  (module (func $block_nested_br_if (result i32)
    (i32.const 1)
    (block (result i32)
      (block (result i32) 
        (block (result i32)
          (br_if 0 (i32.const 1)) ;; should branch to end of innermost block
          (br_if 1 (i32.const 0)) ;; should not branch
        )
        (i32.const 2)
      )
      (i32.const 3)
    )
    (i32.const 4)
    (i32.add)
  ))
  "type mismatch"
)