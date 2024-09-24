;; 10. **Test Description:**     An infinite loop trap test where a `loop` with a `br_if` instruction checks an always-true conditional. Ensure it correctly results in an infinite loop. Compare the behavior across different implementations for consistency.

 ;; (module
  (func $infinite-loop
    (loop $loop
      (br_if 0 (i32.const 1))
    )
  )
  (start $infinite-loop)
)