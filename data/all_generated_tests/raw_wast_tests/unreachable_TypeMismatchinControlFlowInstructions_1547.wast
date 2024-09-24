;; 8. Compose a `select` instruction where one branch contains an `unreachable` followed by `i32.add`, to test if the select enforces strict type constraints from all branches.

(assert_invalid
  (module (func $test-select-unreachable
    (select 
      (i32.add (unreachable) (i32.const 1))
      (i32.const 1)
      (i32.const 1)
    )
  ))
  "type mismatch"
)