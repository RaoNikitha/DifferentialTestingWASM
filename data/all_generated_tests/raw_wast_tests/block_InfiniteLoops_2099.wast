;; Formulate a test where nested blocks contain sequential loops with forward branching (`br` and `br_if`), ensuring the entire structure exits correctly without causing any infinite loops due to mismanaged label stack or state mismatches in WebAssembly or `wizard_engine`.

(assert_invalid
  (module (func $nested-blocks-with-loops (result i32)
    (block (result i32)
      (block (result i32)
        (loop (result i32)
          (br_if 0 (i32.const 1))
          (br 1 (i32.const 2))
        )
        (br 0 (i32.const 3))
      )
      (i32.const 4)
    )
  ))
  "type mismatch"
)