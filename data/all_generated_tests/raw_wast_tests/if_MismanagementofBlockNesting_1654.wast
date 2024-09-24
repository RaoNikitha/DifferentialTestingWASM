;; 5. Write a WebAssembly function with an `if` block containing a `loop`, and place another `if` block inside this loop’s `else` branch. Test the behavior with a `br` instruction targeting the outermost block. This checks whether the reset mechanism accurately maintains control flow across nested if-else-loops.

(assert_invalid
  (module
    (func $nested-if-loop
      (if (block (result i32)
        (i32.const 1)
        (then
          (loop
            (i32.const 0)
            (if
              (i32.eqz)
              (then (br 1))
              (else (nop))
            )
          )
        )
        (else (i32.const 2))
      ))
    )
  )
  "type mismatch"
)