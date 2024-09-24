;; Use a `nop` instruction within a loop that contains a `call` instruction inside it, verifying that the function call is correctly executed on each loop iteration without any misinterpretation of `nop` affecting the control flow.

(assert_invalid
  (module
    (func $loop_with_call (loop (call $some_function) (nop) (br 0)))
    (func $some_function (nop))
  )
  "loop or call misinterpretation"
)