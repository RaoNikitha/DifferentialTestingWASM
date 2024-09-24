;; 7. **Test 7**: Incorporate an `if` instruction inside a `loop` that toggles between nested `if` and `else` blocks each run. Mismanagement in state re-initialization may make this loop infinite due to unhandled state changes.

(assert_invalid
  (module
    (func $toggle-loop
      (loop $loop
        (if (i32.const 1) (then
          (if (i32.const 1) (then (br $loop)) else (br 1))
        ) else
          (if (i32.const 1) (then (br 1)) else (br $loop))
        )
      )
    )
  )
  "type mismatch"
)