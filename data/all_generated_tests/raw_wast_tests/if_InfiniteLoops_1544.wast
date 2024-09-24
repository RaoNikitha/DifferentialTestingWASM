;; 5. **Test Description**: A `loop` containing multiple `if` and `else` sequences, each `if` condition potentially leading to different branches or re-evaluation of the same loop condition.    **Constraint Checked**: Validates nested control flow and loop condition handling within multiple conditional branches.    **Relation to Infinite Loops**: Any mismanagement of branch targets or condition evaluations could result in failing to exit the loop, leading to infinite execution.

(assert_invalid
  (module (func $loop-nested-if-else (result i32)
    (loop $top (result i32)
      (if (result i32) 
          (i32.const 1) 
        (then
          (if (result i32)
              (i32.const 1)
            (then (br $top (i32.const 2)))
            (else (i32.const 3))
          )
          (br $top (i32.const 4))
        )
        (else
          (if (result i32)
              (i32.const 0)
            (then (br $top (i32.const 5)))
            (else (i32.const 6))
          )
        )
      )
    )
  ))
  "type mismatch"
)