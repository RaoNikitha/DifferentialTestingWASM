;; 4. Use `unreachable` in a nested `block` where an outer block's condition is checked using `br_if`. Verify that encountering `unreachable` traps execution immediately while ensuring `br_if` in the outer block condition works as expected.

(assert_invalid
  (module (func $nested-block-unreachable-br_if
    (block 
      (block
        (unreachable)
      ) 
      (br_if 0 (i32.const 1))
    )
  ))
  "type mismatch"
)