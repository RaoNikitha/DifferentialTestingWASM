;; 4. Write a WebAssembly module where a series of `if-else` blocks sequentially wrap each other. Within the `else` block of the deepest level, use `br` to jump to the outermost `if`. Place an `unreachable` instruction immediately within the deepest `else` block, testing whether the branch skips it properly.

(assert_invalid
  (module (func $br-outside-else
    (block
      (if
        (then
          (br 0)
          (unreachable)
        )
        (else
          (br 1)
          (unreachable)
        )
      )
      (br 0)
    )
  ))
  "unknown label"
)