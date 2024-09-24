;; 9. Define `if` inside a `loop` and target the `loop` using `br` from within the `if`. This test checks if the branching correctly returns to the beginning of the `loop`, ensuring **correct backward branch behavior within conditional statements**.

(assert_invalid
  (module (func (loop (if (i32.const 1) (br 1)))))
  "type mismatch"
)