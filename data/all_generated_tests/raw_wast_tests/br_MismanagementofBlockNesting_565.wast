;; 6. Develop a test where conditional branches (`if` blocks) are nested inside multiple levels of loops. Use a `br` instruction to target an outermost loop from within the innermost `if` block and ensure proper handling of control flow and operand stack unwinding.

(assert_invalid
  (module 
    (func
      (block    ;; Outermost block
        (loop     ;; Outermost loop (target of br)
          (block  ;; Intermediate block
            (loop ;; Innermost loop
              (if
                (i32.const 1)
                (then
                  (br 1) ;; Branch to the outermost loop
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)