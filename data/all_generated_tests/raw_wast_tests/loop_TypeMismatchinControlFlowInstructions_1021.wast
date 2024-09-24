;; 2. Create a `loop` instruction where the inner instructions include a `br_if` targeting the loop, but the branch assumes a different return type than the loop's expected result type, causing a type mismatch.

(assert_invalid
  (module (func $br_if-type-mismatch
    (loop (result i32)
      (br_if 0 (i32.const 1))
    )
    (drop)
  ))
  "type mismatch"
)