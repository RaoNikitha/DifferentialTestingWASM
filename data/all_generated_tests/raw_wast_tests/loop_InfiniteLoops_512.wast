;; 3. Use a nested `loop` structure and introduce a `br` instruction that incorrectly branches out of the wrong `loop`. Validate if `WebAssembly` correctly raises an error using `check_seq` while `wizard_engine` mishandles and causes an infinite loop.

(assert_invalid
  (module
    (func $nested-loop-incorrect-branch
      (loop $outer (loop $inner (br 2)) (drop))
    )
  )
  "unknown label"
)