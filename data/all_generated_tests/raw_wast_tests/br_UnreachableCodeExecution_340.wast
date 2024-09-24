;; 1. Create a WebAssembly module with a nested `block`, `loop`, and `if` construct. Use the `br` instruction to branch out of the innermost `block` within the `loop`, followed by an `unreachable` instruction inside the innermost `block`. This differential test will check whether the different implementations correctly handle the nesting and reference the proper labels, leading to a direct comparison on whether the `unreachable` instruction is reached erroneously.

(assert_invalid
  (module
    (func $nested_br
      (block
        (loop
          (if (i32.const 1)
            (block
              (br 1)
              unreachable
            )
          )
        )
      )
    )
  )
  "unreachable instruction is reachable"
)