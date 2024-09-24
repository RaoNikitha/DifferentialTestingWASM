;; Test Description 2: Design a block containing nested blocks, with inner blocks containing `loop` instructions and `br` branching back to the starting label of the outermost block, potentially causing an infinite loop if the indexing does not resume at the correct point after the `br`.

(assert_invalid
  (module
    (func $nested-blocks-with-loop 
      (block (result i32)
        (block 
          (loop
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)