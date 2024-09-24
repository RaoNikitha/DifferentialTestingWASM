;; Test 9: Create a nested `if-else` structure where the inner `if` has a block type output mismatch between `then` and `else` branches, one producing `i32` and the other producing `f32`.

(assert_invalid
  (module (func $nested-if-else-mismatch (result i32)
    (if (result i32)
      (i32.const 1)
      (then 
        (if (result i32)
          (i32.const 1)
          (then (i32.const 42))
          (else (f32.const 3.14))
        )
      )
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)