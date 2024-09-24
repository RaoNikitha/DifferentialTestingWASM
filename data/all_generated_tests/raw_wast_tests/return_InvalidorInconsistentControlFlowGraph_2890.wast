;; 9. **Test 9**: Simulate a scenario with a `return` instruction inside a block that is terminated with a `br` (branch) instruction ensuring the `br` is disregarded correctly if the `return` takes effect, leading to inconsistencies in improper CFG management.

(assert_invalid
  (module
    (func $return-br-block (result i32)
      (block
        (return)
        (br 0)
      )
      (i32.const 0))
  )
  "type mismatch"
)