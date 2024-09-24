;; 2. Use deeply nested control blocks, with a `br` targeting a loop on an inner level. Ensure that the incomplete stack unwinding logic could disrupt the forwarding to the loop, which could cause the loop to not exit correctly and result in an infinite loop.

(assert_invalid
  (module
    (func $deeply_nested_loop
      (block
        (loop
          (block
            (block
              (loop
                (br 3)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)