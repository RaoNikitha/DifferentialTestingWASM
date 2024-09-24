;; 2. **Loop with Multiple Nested Blocks:**    Construct a `loop` containing several nested `block` instructions, with a `br` targeting a label within the loop but several layers deep in nested blocks. This will test if the implementation can correctly backtrack through multiple levels of block nesting within a loop.

(assert_invalid
  (module
    (func $loop-with-multiple-nested-blocks
      (loop
        (block
          (block
            (block
              (br 1)
            )
          )
        )
      )
    )
  )
  "unknown label"
)