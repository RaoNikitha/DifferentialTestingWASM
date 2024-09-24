;; Test 4: A `block` instruction containing instructions that pop more values from the stack than are pushed. This checks whether over-popping is detected and whether stack corruption is prevented during execution.

(assert_invalid
  (module (func $over-popping
    (block (result i32)
      (i32.const 1)
      (drop) (drop)
    )
  ))
  "type mismatch"
)