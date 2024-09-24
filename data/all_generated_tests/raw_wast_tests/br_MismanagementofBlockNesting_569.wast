;; 10. Construct a test with a deeply nested combination of `if`, `block`, and `loop` structures, utilizing multiple `br` instructions to target outer blocks and loops. This test is designed to catch any mismanagement of stack unwinding and label indexing that could lead to incorrect branching or failed control flow.

(assert_invalid
  (module
    (func $test-nested-br (param i32) (result i32)
      (block $outer
        (loop $middle
          (block $inner
            (if (i32.const 1)
              (then
                (br $outer)
              )
              (else
                (br $middle)
              )
            )
            (br $inner)
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)