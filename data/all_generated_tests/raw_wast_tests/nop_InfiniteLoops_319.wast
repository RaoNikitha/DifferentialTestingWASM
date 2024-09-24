;; 10. In a `loop` with multiple `br` and `br_if` branching paths, place `nop` strategically around each path to determine if any cause control mismanagement, leading to infinite execution despite the `ir` directives.

(assert_invalid
  (module
    (func (loop (nop) (br 0) (nop) (br_if 1 (i32.const 0)) (nop)))
  )
  "type mismatch"
)