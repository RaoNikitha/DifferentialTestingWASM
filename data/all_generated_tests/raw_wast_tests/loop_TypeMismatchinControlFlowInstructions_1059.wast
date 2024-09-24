;; 10. Construct a `loop` that expects an empty stack (`[]`) but includes an instruction inside that causes a type `i32` to be left on the stack erroneously through a `br` branch. This checks whether both implementations enforce stack type constraints rigorously during loop block exits.

(assert_invalid
  (module (func (loop (result i32) (i32.const 0) (br 0)))
  )
  "type mismatch"
)