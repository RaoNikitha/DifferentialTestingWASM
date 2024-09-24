;; 3. Test nested if-else constructs with a `br` instruction targeting the else block from within an inner if. The test ensures that relative label indexing is correctly interpreted in conditional constructs.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then (block (if (i32.const 0) (then) (else (br 1)))))
      )
    )
  )
  "type mismatch"
)