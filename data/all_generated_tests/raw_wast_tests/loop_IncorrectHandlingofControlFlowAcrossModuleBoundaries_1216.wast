;; 7. A `loop` instruction that exports a function relying on the loop's label for correct branching. This exported function is then imported and called from another module, checking for accurate label tracking across boundaries.

(assert_invalid
  (module
    (func $loop_func (result i32)
      (i32.const 0)
      (loop (result i32)
        (br 0)
      )
    )
    (export "loop_func" (func $loop_func))
  )
  "type mismatch"
)