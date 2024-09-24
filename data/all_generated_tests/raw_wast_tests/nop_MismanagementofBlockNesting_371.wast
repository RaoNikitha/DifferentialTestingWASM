;; 3. A loop containing nested blocks with `nop` instructions interspersed within the loop body and in different blocks, ensuring that `nop` placement does not incorrectly cause early exits or misinterpretation of loop iterations. The trace validation should match the expected execution flow.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer
        (block $inner
          nop
          (br $inner)
          (loop $inner-loop
            nop
            (br $outer) ; This branch should go to the outer loop
          )
        )
        (br $outer)
      )
    )
  )
  "invalid loop nesting"
)