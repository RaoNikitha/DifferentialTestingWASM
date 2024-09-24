;; Test4: Place a `br_table` inside a `loop` within a block, incorrectly indexing labels from both `loop` and `block`. Expect `wizard_engine` to detect the mismanagement of nested blocks instantly with an arity mismatch error, whereas WebAssembly might perform unintended control flow changes.

(assert_invalid
  (module
    (func 
      (block
        (loop
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "arity mismatch"
)