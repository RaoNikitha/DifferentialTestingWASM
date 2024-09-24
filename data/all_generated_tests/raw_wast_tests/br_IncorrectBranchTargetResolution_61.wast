;; 2. Create a scenario with multiple nested `loop` constructs and use `br` to target a label in the outermost `loop`. Evaluate whether the correct `loop` is targeted without causing an infinite loop.

(assert_invalid
  (module
    (func (block (loop (loop (block (br 2)))))))
  "invalid break depth"
)