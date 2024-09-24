;; 9. Test Description: **Interwoven Loops, Blocks, and Conditional Branching**    - Combine a mixture of `loop` and `block` constructs, where each has a conditional `br` referencing different levels of nesting. Test if the execution flow respects the structured control and branch target.    - Constraint: Ensures structured control flow in deeply interwoven nested constructs.

(assert_invalid
  (module
    (func $interwoven-loops-blocks
      (block $outer
        (block $middle
          (loop $inner
            (br_if $outer (i32.const 1)) ;; Attempt to branch to an outer block
            (br_if $middle (i32.const 0)) ;; Conditional branch within nesting
          )
        )
      )
    )
  )
  "type mismatch"
)