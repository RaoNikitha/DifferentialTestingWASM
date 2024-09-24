;; 5. In a nested `loop` structure, place `unreachable` in the inner loop, followed by an instruction sequence in the outer loop assuming a specific result type from the inner loop. This should cause a type mismatch in stack assumptions.

(assert_invalid
  (module (func $nested-loop-unreachable
    (block $outer
      (loop $inner
        (unreachable)
      )
      (i32.add)
    )
  ))
  "type mismatch"
)