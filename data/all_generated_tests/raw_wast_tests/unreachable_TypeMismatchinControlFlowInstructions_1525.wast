;; 6. Create a `block` with an `unreachable` instruction, followed by multiple `i32.const` instructions assuming valid `i32` values. Attempt to perform an `i32.add` operation and observe the type mismatch error.

(assert_invalid
  (module (func $type-block-unreachable-then-i32-const (result i32)
    (block 
      (unreachable) 
      (i32.const 1)
      (i32.const 2)
      (i32.add)
    )
  ))
  "type mismatch"
)