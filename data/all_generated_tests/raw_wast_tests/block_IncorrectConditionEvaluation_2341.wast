;; 2. Define a nested block structure. The outer block has a `blocktype` producing an i32 result. Inside, situate an inner block with an `if` condition checking an i32 value. Use `br_if` inside the inner block to test if branching works accurately based on the condition. Verify if the inner condition evaluation affects the outer block correctly.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i32)
        (if (i32.const 1)
            (then (br_if 1 (i32.const 0)))
            (else (i32.const 1))
        )
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)