;; - A function with an `if` structure containing a `br_if` instruction inside its branch, which conditionally breaks and calls another function based on the top of the stack. Incorrect handling here may lead to improper function calls and return sequences.

(assert_invalid
  (module (func $conditional-function-call
    (block
      (if (i32.const 1)
        (then
          (br_if 0 (call $dummy-function))
        )
      )
      (call $dummy-function)
    )
  )
  (func $dummy-function)
  )
  "type mismatch"
)