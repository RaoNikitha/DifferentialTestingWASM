;; 6. Validate the behavior of nested `br` instructions within multiple `if` constructs wrapping calls to imported functions, ensuring operability and target address correctness across different modules.

(assert_invalid
  (module
    (import "env" "funcA" (func $funcA))
    (func $test
      (block
        (if
          (then
            (call $funcA)
            (block
              (if (then (br 2)))
            )
          )
        )
      )
    )
  )
  "unknown label"
)