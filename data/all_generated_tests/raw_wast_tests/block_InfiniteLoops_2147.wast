;; Test Description 8: Design a scenario starting with an outer block, followed by multiple inner blocks, each with loops where `br_if` branches should exit to their immediate enclosing block. Incorrect forward branching or label indexing causes perpetual looping.

(assert_invalid
  (module
    (func $nested-blocks-loops (result i32)
      (block (result i32)
        (block
          (loop $loop1
            (block
              (loop $loop2
                (i32.const 1)
                (br_if 1)
                (br_if 2)
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)