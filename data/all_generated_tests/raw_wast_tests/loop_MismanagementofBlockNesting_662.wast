;; - Test 3: Construct a loop with nested blocks and use multiple `br_if` instructions pointing to different depths. Verify if each `br_if` correctly interprets its target amidst the complex nesting. This evaluates handling of labels and checking if conditional branches maintain the correct pathwithin nested structures.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (br_if 1)
          (i32.const 2)
          (br_if 0)
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)