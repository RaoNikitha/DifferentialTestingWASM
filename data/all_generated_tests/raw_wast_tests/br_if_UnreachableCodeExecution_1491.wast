;; 2. **Test 2**: Implement a nested block where an inner block contains an `br_if` instruction that conditionally branches to an `unreachable` instruction in the outer block. Push a non-zero value and take the branch to `unreachable`, ensuring the proper stack unwinding before hitting the `unreachable` code.

(assert_invalid
  (module 
    (func $nested-blocks
      (block 
        (block (unreachable) (br_if 1 (i32.const 1)))
      )
    )
  )
  "unknown label"
)