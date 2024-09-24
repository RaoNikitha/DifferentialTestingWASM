;; 8. **Incorrect Function Index in a Loop Call**: Introduce a loop that attempts to call a function using an out-of-bound index. This evaluates how the function index bounds are enforced within loops, potentially leading to infinite loops if mishandled.

(assert_invalid
  (module
    (func (export "main")
      (loop
        (call 999999)
        (br 0)
      )
    )
  )
  "unknown function"
)