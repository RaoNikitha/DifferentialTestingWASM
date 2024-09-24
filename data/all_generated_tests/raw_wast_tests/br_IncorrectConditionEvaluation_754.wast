;; Test 5: Build a module with a `block` that has a `br_if` instruction which triggers if a subtraction result is zero. Confirm branching occurs accurately when the result is zero, testing correct zero condition evaluation.

(assert_invalid
  (module
    (func $block_br_if_zero
      (block
        (i32.const 5)
        (i32.const 5)
        (i32.sub)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "label index out of bounds"
)