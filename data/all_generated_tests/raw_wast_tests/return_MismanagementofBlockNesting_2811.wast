;; 10. Formulate a test with nested blocks interconnected by local and global variables. Introduce a `return` instruction inside the deepest block which is dependent on intermediate variable states, enforcing the correct reset and validation states through nested exits.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $nested_return (local i32)
      (local.set 0 (i32.const 1))
      (block 
        (block 
          (local.set 0 (i32.const 2))
          (block 
            (local.set 0 (i32.const 3))
            (return)
          )
        )
        (return)
      )
      (global.set $g (local.get 0))
    )
  )
  "type mismatch"
)