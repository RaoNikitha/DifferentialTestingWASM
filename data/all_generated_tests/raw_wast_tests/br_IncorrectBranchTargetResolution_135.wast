;; 6. **Backward Branch from an If-block:**    Place a `loop` structure containing an `if` block, and inside this `if`, employ a `br` instruction to jump back to the beginning of the `loop`. Validate that branching correctly jumps to the start of the loop.

(assert_invalid
  (module
    (func $backward-branch-from-if
      (loop $loop
        (if (i32.const 1)
          (then
            (br $loop)
          )
        )
      )
    )
  )
  "type mismatch"
)