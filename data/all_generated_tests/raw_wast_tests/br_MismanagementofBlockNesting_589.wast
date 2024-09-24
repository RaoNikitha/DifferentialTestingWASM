;; 10. Design a sequence where `br` inside nested blocks within a loop targets the loop itself. This tests proper loop re-entry and block stack unwinding when connecting nested blocks and loop structures.

(assert_invalid
  (module
    (func $br-nested-blocks-in-loop
      (loop
        (block
          (block
            (br 2)
          )
        )
      )
    )
  )
  "unknown label"
)