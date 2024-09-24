;; 10. Create a test where `i32.and` is used to evaluate a complex condition in `br_if`, directing control to `unreachable`. Ensure conditions logically avoid activating `unreachable`. The test checks if condition evaluation mistakes cause unintended trapping.

(assert_invalid
  (module
    (func $complex-br_if-unreachable
      (block $outer
        (br_if $outer
          (i32.and
            (i32.const 1)
            (i32.eq
              (i32.const 2)
              (i32.const 3)
            )
          )
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)