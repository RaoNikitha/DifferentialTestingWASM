;; 9. Introduce heavy nesting with different combinations of if-else, blocks, and loops, then execute a `br` to a deeply nestled if block’s end, verifying if the engine correctly manages contextual block nesting and jumps.

(assert_invalid
  (module
    (func $nested_br_test
      (block
        (loop
          (block
            (if
              (i32.const 1)
              (then
                (block
                  (loop
                    (block
                      (br 5)
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)