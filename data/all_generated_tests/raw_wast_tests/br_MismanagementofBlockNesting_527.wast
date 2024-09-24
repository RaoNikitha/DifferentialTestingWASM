;; 8. Implement a nested configuration where `blocks` are inside a `loop`, and a `br` instruction within the inner block targets the outermost block. The test verifies if the control flow correctly resumes after the targeted outermost block’s `end`. This ensures robustness in handling deeply nested control structures.

(assert_invalid
  (module
    (func $nested-blocks-in-loop
      (loop (block (block (br 2))))
    )
  )
  "unknown label"
)