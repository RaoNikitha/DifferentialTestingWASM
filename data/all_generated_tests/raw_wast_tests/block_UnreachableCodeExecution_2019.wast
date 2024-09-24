;; 10. **Test Description**: Implement a block containing sequential `br` and `br_if` instructions interspersed with push/pop operations, leading towards an `unreachable` instruction conditionally. Verify that the control flow accurately avoids the `unreachable` based on stack conditions and branch targets.

(assert_invalid
  (module (func $conditional_br_unreachable
    (block $outer_block
      (block $inner_block
        (br_if $inner_block (i32.const 1)) ; should branch out of $inner_block
        (drop)
        (unreachable)
      )
      (unreachable)
    )
  ))
  "unreachable executed"
)