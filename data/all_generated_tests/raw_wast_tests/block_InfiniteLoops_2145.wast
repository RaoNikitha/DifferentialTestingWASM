;; Test Description 6: Create a block with interleaved instructions where an inner loop's `br` to an outer block gets transformed to check if the correct block is referenced. Incorrect indexing would continuously loop without termination.

(assert_invalid
  (module
    (func $block-nested-branch (result i32)
      (block (result i32)
        (loop
          (block (br 1 (i32.const 1))) ;; Incorrectly indexed branch
        )
      )
    )
  )
  "type mismatch"
)