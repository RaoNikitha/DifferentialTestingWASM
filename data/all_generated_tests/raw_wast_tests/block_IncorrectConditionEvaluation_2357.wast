;; Test Description 8: A `block` nested within another block, with the inner block containing a `br_if`. Test that the condition for the `br_if` correctly reflects a variable manipulated in the outer block, making sure the jump precisely conforms to the condition evaluated in outer scope.

(assert_invalid
  (module (func $test
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (br_if 0 (i32.const 1))
        (i32.const 2)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)