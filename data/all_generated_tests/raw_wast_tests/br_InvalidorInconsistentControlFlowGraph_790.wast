;; A deeply nested `if`-`else` structure where the `br` instruction tries to break out multiple levels using relative label indexing. Check if both implementations correctly resolve the label indices. Testing for: Incorrect handling of label indices in nested structures can lead to incorrect branch targets and invalid CFG.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (i32.const 5)
        (block (result i32)
          (i32.const 10)
          (block (result i32)
            (i32.const 15)
            (if (result i32)
              (then
                (block (result i32)
                  (br 4) ;; Attempt to break out with incorrect relative indexing
                )
              )
              (else
                (i32.const 20)
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)