;; 7. Construct a nested `if` structure within a loop where the innermost `else` branch contains another loop followed by an `if` block. Use a `br` instruction in the outer `if` block to test the correct resetting of block depth when exiting from inner nested blocks.

(assert_invalid
  (module
    (func $nested_if_loop
      (loop
        (if (i32.const 1)
          (then
            (br 1)
          )
          (else
            (loop
              (if (i32.const 0)
                (then (unreachable))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)