;; 6. Implement a WebAssembly module that nests multiple `loop` constructs. Use the `br` instruction to continuously loop back to the starting point of the innermost loop. Include an `unreachable` instruction within the loop, before the branch instruction, to verify if the branch correctly targets the loop start without reaching unreachable code.

(assert_invalid
  (module
    (func $nested-loops
      (block
        (loop (result i32)
          (loop (result i32)
            (unreachable)
            (br 0)
            (i32.const 0)
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)