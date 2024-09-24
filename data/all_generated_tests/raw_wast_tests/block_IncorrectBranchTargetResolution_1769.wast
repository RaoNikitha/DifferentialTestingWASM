;; 10. A complex control flow test where blocks with nested `br_table` instructions use a variety of labels to check if each possible target is resolved accurately according to the relative nesting structure. This ensures reliable label resolution and correct branching behavior.

(assert_invalid
  (module (func
    (block
      (block (result i32)
        (block (result i32)
          (i32.const 10)
          (br_table 0 1 2)
          (i32.const 20)
        )
        (i32.const 30)
      )
      (i32.const 40)
    )
  ))
  "type mismatch"
)