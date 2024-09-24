;; 10. Develop a branching scenario in a `br_table` where label indices point to various lengths of operand types. Mismatch the operand type sequence on purpose, with the default directing to `unreachable`, to ensure correct operand type enforcement.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (loop
            (block (result i32)
              (br_table 0 1 (i32.const 1) (f32.const 0.0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)