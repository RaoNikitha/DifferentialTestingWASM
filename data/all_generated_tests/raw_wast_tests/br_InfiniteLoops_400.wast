;; 1. Test the `br` instruction targeting a `loop` with a condition that should break out of the loop (`br_if`), ensuring the condition is properly evaluated. Incorrect evaluation may result in the loop never terminating.

(assert_invalid
  (module
    (func $loop-break-condition
      (loop $L (result i32)
        (i32.const 0)
        (br_if 1 (i32.const 1)) ;; Should break out of loop
        (br 0)
      )
    )
  )
  "type mismatch"
)