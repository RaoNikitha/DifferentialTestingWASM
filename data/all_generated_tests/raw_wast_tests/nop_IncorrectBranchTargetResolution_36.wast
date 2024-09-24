;; - Test Description 7: Construct a test case with nested if-else blocks containing `nop` instructions followed by branches targeting various nested blocks. Validate if `nop` input misleads branch target resolution, causing unpredictable behavior in nested branching.

(assert_invalid
  (module
    (func $nested-blocks-with-nop
      (block $outer
        (block $inner
          (if (i32.const 0)
            (then (nop) (br $outer))
            (else (nop) (br $inner))
          )
        )
      )
    )
  )
  "type mismatch"
)