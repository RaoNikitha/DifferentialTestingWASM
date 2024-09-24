;; Devise an `if` block where a `br_table` within a loop in the `else` branches use indices that mismatch the expected context, particularly to detect if WebAssembly's function-applicative approach validates it differently.

(assert_invalid
  (module
    (func
      (loop 
        (if (i32.const 0)
          (then)
          (else
            (br_table 0 1 2 (i32.const 1))
          )
        )
      )
    )
  )
  "label index out of bounds"
)