;; - Test 2: Implement a loop where a `br` instruction incorrectly sets the label in the context, causing `Wizard Engine` to infinitely jump back to the loop start.

(assert_invalid
  (module (func $incorrect-br-label
    (loop (param i32) (i32.const 0) (br 1)) ;; Incorrect label index for br
  ))
  "unknown label"
)