;; 8. **Br Targeting Function Entry Block:**    - Implement a function where the `body` contains a `block` and a `br` instruction targeting that block immediately after a function call (`call`). Check if the `br` correctly transfers control to the block post-function call without disrupting other outer block scopes.

(assert_invalid
  (module
    (func $br_targeting_function_entry_block
      (block 
        (call $some_function)
        (br 0)
      )
    )
    (func $some_function)
  )
  "unknown label"
)