;; 2. Construct a module with a loop that has an input type of `i64`. Use a `br` instruction within the loop targeting the loop itself, while pushing an `i32` value. This test will verify if the engine correctly checks and matches the input type of the loop on backward branches.

(assert_invalid
  (module
    (func $type-arg-input-type-mismatch-in-loop
      (loop $loop_label (param i64)
        (br $loop_label (i32.const 1))
      )
    )
  )
  "type mismatch"
)