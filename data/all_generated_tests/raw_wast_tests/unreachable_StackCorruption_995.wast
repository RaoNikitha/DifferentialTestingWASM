;; 6. Create a nested `block` and `if` with mismatched stack depths, including `unreachable` inside the deepest control structure. Check for consistent stack corruption handling by verifying no incorrect values polluting other parts of the stack.

(assert_invalid
  (module (func $nested-block-if-unreachable
    (block
      (block
        (if
          (then (unreachable))
        )
        (i32.const 1)
      )
      (drop)
    )
    (i32.const 0)
  ))
  "type mismatch"
)