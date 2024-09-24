;; - **Test 8: Unreachable at Deep Nesting Level with Complex Condition Checks**   ```   Use deeply nested `block` structures with multiple `br_if` instructions before an `unreachable` instruction. Complex conditions ensuring reaching the trap should highlight any incorrect condition evaluations due to the nesting impacting control flow.   ``` -

(assert_invalid
  (module
    (func $deep-nesting-with-complex-cond
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (block
                        (block
                          (block
                            (br_if 9 (i32.eq (i32.const 1) (i32.const 1)))
                            (unreachable)))))))))))))))
  "type mismatch")