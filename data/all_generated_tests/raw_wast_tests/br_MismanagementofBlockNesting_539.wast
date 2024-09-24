;; 10. Construct a test where a `block` wraps multiple nested `block` and `loop` instructions, each with complex operand stack interactions, and then use a `br` to jump to an outer block. This will ensure comprehensive testing of operand stack unwinding and maintaining structured control flow during the branch.

(assert_invalid
  (module
    (func $test_function
      (block $outer
        (block $inner
          (block $innermost
            (loop $loop1
              (i32.const 10) (i32.const 20)
              (br $outer)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)