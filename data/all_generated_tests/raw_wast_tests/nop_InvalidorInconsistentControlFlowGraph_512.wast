;; 3. Use `nop` inside a `loop` and validate if the loop counter and iteration behavior remain unmodified.    **Constraint:** Verify `nop` does not disrupt the loop control flow.

(assert_invalid
  (module
    (func $loop-with-nop
      (loop $L
        (nop)
        (br $L)
      )
    )
  )
  "invalid loop body"
)