;; 9. Design a series of nested blocks (`block`) and a `loop`, with a `br` that targets an outer block and a `br_table` inside an inner `block` targeting varying depths in the loops. Validate if the control flow through the `br_table` and `br` resumes at the correct outer constructs.

(assert_invalid
  (module (func $nested-block-loop-test 
    (block (result i32)
      (block
        (loop (result i32)
          (block (result i32)
            (br_table 0 1 2 (i32.const 1))
            (br 1 (i32.const 2))
          )
        )
        (i32.const 3)
      )
    )
  ))
  "type mismatch"
)