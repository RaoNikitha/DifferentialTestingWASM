;; Implement a `loop` with nested `loop` blocks, using `br_if` to target the outer `loop` conditionally based on a stack value. Push `1` (true) on the stack to verify correct outer loop branching.

(assert_invalid
  (module (func $nested_loop_outward_branch
    (loop $outer (block $inner
      (br_if $outer (i32.const 1))
      (loop $innermost (br $inner))
    ))
  ))
  "type mismatch"
)