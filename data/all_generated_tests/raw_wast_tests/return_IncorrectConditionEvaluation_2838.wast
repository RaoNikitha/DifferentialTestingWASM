;; 7. Develop a function where `br_if` is nested within another `br_if`, followed by a return. Evaluate if incorrect nested condition handling causes an incorrect return flow and mismatched results.

(assert_invalid
  (module
    (func $nested-br_if-return (result i32)
      (i32.const 1)
      (block (result i32)
        (br_if 0 (i32.eqz (i32.const 0)))
        (br_if 0 (i32.eqz (i32.const 0)))
        (return (i32.const 2))
      )
      (i32.const 3)
    )
  )
  "type mismatch"
)